{{ config(
    materialized='table'
) }}

SELECT

    {{ dbt_utils.generate_surrogate_key(['store_id']) }} AS store_sk,

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