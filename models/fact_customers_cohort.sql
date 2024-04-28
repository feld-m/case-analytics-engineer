-- A dimension montly cohort of “customers” table with additional sales metrics:

{{ config(
    materialized='table',
) }}


WITH RECURSIVE calendar_generator AS (
  SELECT
    MIN(DATE(orderdate)) AS cohort_month
  FROM {{ ref('stg_orders') }}
  UNION ALL
  SELECT
    DATE(cohort_month, '+1 month')
  FROM calendar_generator
  WHERE cohort_month < (
    SELECT MAX(DATE(orderdate)) FROM {{ ref('stg_orders') }}
  )
)

, calendar AS (
  SELECT DISTINCT strftime('%Y-%m', cohort_month) AS cohort_month
  FROM calendar_generator
)

, customer_cohort_base AS (
  SELECT
    customer_id
    , country
    , strftime('%Y-%m',customer_since_date) AS cohort_month
    , total_order_value AS total_revenue
  FROM {{ ref('dim_customers') }}
)


, cohort_metrics AS (
  SELECT
    cc.cohort_month
    , country
    , COUNT(DISTINCT cc.customer_id) AS num_customers
    , SUM(cc.total_revenue) AS total_order_value
  FROM customer_cohort_base cc
  GROUP BY 1, 2
)


, monthly_cohorts AS (
  SELECT
    cal.cohort_month
    , cm.country
    , cm.num_customers
    , cm.total_order_value
  FROM calendar cal
  LEFT JOIN cohort_metrics cm ON cal.cohort_month = cm.cohort_month
)

SELECT * 
FROM monthly_cohorts
