-- Source: Define the stg table containing order details data
{{ config(
    materialized='table',
) }}


SELECT *
FROM {{ source('main', 'order_details') }}
