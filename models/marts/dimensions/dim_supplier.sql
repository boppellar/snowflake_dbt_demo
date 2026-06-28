{{ config(
    materialized='table'
) }}

SELECT

    {{ dbt_utils.generate_surrogate_key(['supplier_id']) }} AS supplier_sk,

    supplier_id,
    supplier_name,
    contact_name,
    phone,
    email,
    city,
    country,
    status

FROM {{ ref('stg_supplier') }}