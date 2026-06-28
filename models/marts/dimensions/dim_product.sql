{{ config(
    materialized='table'
) }}

SELECT

    {{ dbt_utils.generate_surrogate_key(['product_id']) }} AS product_sk,

    product_id,
    product_name,
    category,
    sub_category,
    brand,
    unit_price,
    cost_price,
    supplier_id,
    status

FROM {{ ref('stg_product') }}