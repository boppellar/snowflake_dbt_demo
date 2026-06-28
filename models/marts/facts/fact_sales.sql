{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_line_id'
) }}

SELECT

    order_line_id,

    order_id,
    order_date,

    customer_id,

    product_id,

    quantity,
    unit_price,
    discount,
    tax_amount,
    line_total,

    payment_method,
    payment_status,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM {{ ref('int_sales_enriched') }}

{% if is_incremental() %}

WHERE order_date >
(
    SELECT COALESCE(MAX(order_date), '1900-01-01')
    FROM {{ this }}
)

{% endif %}