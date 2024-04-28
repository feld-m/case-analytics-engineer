-- A transactional fact table for sales at the product level with additional dimensions and metrics
{{ config(
    materialized='table',
) }}


WITH order_base AS (
  SELECT
    orderID AS order_id
    , DATE(orderDate) AS order_date
    , customerID AS customer_id
  FROM {{ ref('stg_orders') }}
)

, add_customer_metrics AS (
  SELECT
    customer_id
    , MIN(order_date) AS first_order_date
    , MAX(order_date) AS last_order_date
    , julianday(MAX(order_date)) - julianday(MIN(order_date)) AS customer_lifetime
    , COUNT(*) AS n_orders
  FROM order_base 
  GROUP BY 1
)

, order_item_base AS (
  SELECT
    ob.order_id
    , ob.order_date
    , ob.customer_id
    , cus.companyname AS customer_name
    , CASE
      WHEN n_orders = 1 OR ob.order_date = first_order_date THEN 'new'
      ELSE 'recurring'
    END AS customer_type
    , CASE
      WHEN n_orders = 1 THEN NULL
      ELSE customer_lifetime
    END AS customer_lifetime
    , n_orders
    , first_order_date AS customer_since_date
    , SUM(prd.unitprice * ord_d.quantity) AS total_amount
    , GROUP_CONCAT(
      '{"product_id": ' || ord_d.productid || ', "product_name": "' || prd.productName || '", "quantity": ' || ord_d.quantity || ', "discounted": ' || prd.unitprice || '}',
      ', '
    ) AS product_details
  FROM order_base AS ob
  LEFT JOIN {{ ref('stg_order_details') }} AS ord_d ON ord_d.orderid = ob.order_id
  LEFT JOIN {{ ref('stg_products') }} AS prd ON prd.productid = ord_d.productid
  LEFT JOIN {{ ref('stg_customers') }} AS cus ON cus.customerID = ob.customer_id
  LEFT JOIN add_customer_metrics AS add_m ON add_m.customer_id = ob.customer_id
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
)

SELECT *
FROM order_item_base