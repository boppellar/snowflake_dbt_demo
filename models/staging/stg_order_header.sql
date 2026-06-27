{{ config(materialized='view') }}

SELECT
    ORDER_ID AS order_id,
    CUSTOMER_ID AS customer_id,
    STORE_ID AS store_id,
    ORDER_DATE AS order_date,
    ORDER_STATUS AS order_status,
    PAYMENT_STATUS AS payment_status,
    SHIPPING_ADDRESS AS shipping_address,
    TOTAL_AMOUNT AS total_amount
FROM {{ source('bronze','ORDER_HEADER_RAW') }}
