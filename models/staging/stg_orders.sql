-- Source: Define the stg table containing order data
{{ config(
    materialized='table',
) }}


SELECT *
FROM {{ source('main', 'orders') }} 
