{{
config(
    materialized='incremental',
    incremental_strategy='append'
)
}}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    TOTAL_AMOUNT,
    ORDER_UPDATED_AT
FROM {{ source('ecommerce','raw_orders') }}

{% if is_incremental() %}

WHERE ORDER_UPDATED_AT >
(
    SELECT MAX(ORDER_UPDATED_AT)
    FROM {{ this }}
)

{% endif %}