{{ config(materialized='view') }}

SELECT
    PRODUCT_ID AS product_id,
    PRODUCT_NAME AS product_name,
    CATEGORY AS category,
    SUB_CATEGORY AS sub_category,
    BRAND AS brand,
    UNIT_PRICE AS unit_price,
    COST_PRICE AS cost_price,
    SUPPLIER_ID AS supplier_id,
    STATUS AS status,
    CREATED_DATE AS created_date,
    UPDATED_DATE AS updated_date
FROM {{ source('bronze','PRODUCT_RAW') }}
