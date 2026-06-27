{{ config(materialized='view') }}

SELECT
    ORDER_LINE_ID AS order_line_id,
    ORDER_ID AS order_id,
    PRODUCT_ID AS product_id,
    QUANTITY AS quantity,
    UNIT_PRICE AS unit_price,
    DISCOUNT AS discount,
    TAX_AMOUNT AS tax_amount,
    LINE_TOTAL AS line_total
FROM {{ source('bronze','ORDER_LINE_RAW') }}
