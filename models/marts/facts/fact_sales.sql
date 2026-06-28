{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_line_id'
) }}

SELECT

    s.order_line_id,
    s.order_id,
    s.order_date,

    dc.customer_sk,
    dp.product_sk,

    s.quantity,
    s.unit_price,
    s.discount,
    s.tax_amount,
    s.line_total,

    s.payment_method,
    s.payment_status,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM {{ ref('int_sales_enriched') }} s

INNER JOIN {{ ref('dim_customer') }} dc
    ON s.customer_id = dc.customer_id

INNER JOIN {{ ref('dim_product') }} dp
    ON s.product_id = dp.product_id

{% if is_incremental() %}

WHERE s.order_date >
(
    SELECT COALESCE(MAX(order_date), '1900-01-01')
    FROM {{ this }}
)

{% endif %}