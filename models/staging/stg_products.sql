-- Source: Define the stg table containing product details data
{{ config(
    materialized='table',
) }}


SELECT *
FROM {{ source('main', 'products') }}