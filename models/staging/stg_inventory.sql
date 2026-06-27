{{ config(materialized='view') }}

SELECT
    INVENTORY_ID AS inventory_id,
    PRODUCT_ID AS product_id,
    STORE_ID AS store_id,
    STOCK_QUANTITY AS stock_quantity,
    REORDER_LEVEL AS reorder_level,
    LAST_RESTOCK_DATE AS last_restock_date,
    LAST_UPDATED AS last_updated
FROM {{ source('bronze','INVENTORY_RAW') }}
