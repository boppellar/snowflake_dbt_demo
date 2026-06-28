{{ config(
    materialized='table'
) }}

SELECT

    supplier_id,
    supplier_name,
    contact_name,
    phone,
    email,
    city,
    country,
    status

FROM {{ ref('stg_supplier') }}
