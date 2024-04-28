-- Source: Define the stg table containing customers data
{{ config(
    materialized='table',
) }}


SELECT *
FROM {{ source('main', 'customers') }}
