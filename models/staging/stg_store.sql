{{ config(materialized='view') }}

SELECT
    STORE_ID AS store_id,
    STORE_NAME AS store_name,
    STORE_TYPE AS store_type,
    ADDRESS AS address,
    CITY AS city,
    STATE AS state,
    COUNTRY AS country,
    PINCODE AS pincode,
    MANAGER_ID AS manager_id,
    STATUS AS status,
    CREATED_DATE AS created_date
FROM {{ source('bronze','STORE_RAW') }}
