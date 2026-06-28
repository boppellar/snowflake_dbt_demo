{{ config(
    materialized='table'
) }}

SELECT

    store_id,
    store_name,
    store_type,
    address,
    city,
    state,
    country,
    pincode,
    manager_id,
    status

FROM {{ ref('stg_store') }}
