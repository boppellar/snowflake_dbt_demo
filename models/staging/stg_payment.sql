{{ config(materialized='view') }}

SELECT
    PAYMENT_ID AS payment_id,
    ORDER_ID AS order_id,
    PAYMENT_DATE AS payment_date,
    PAYMENT_METHOD AS payment_method,
    PAYMENT_STATUS AS payment_status,
    AMOUNT AS amount,
    TRANSACTION_ID AS transaction_id
FROM {{ source('bronze','PAYMENT_RAW') }}
