{{ config(materialized='view') }}

SELECT
    RETURN_ID AS return_id,
    ORDER_ID AS order_id,
    PRODUCT_ID AS product_id,
    RETURN_DATE AS return_date,
    RETURN_REASON AS return_reason,
    RETURN_STATUS AS return_status,
    REFUND_AMOUNT AS refund_amount
FROM {{ source('bronze','RETURNS_RAW') }}
