{{ config(materialized='view') }}

SELECT
    SUPPLIER_ID AS supplier_id,
    SUPPLIER_NAME AS supplier_name,
    CONTACT_NAME AS contact_name,
    PHONE AS phone,
    EMAIL AS email,
    ADDRESS AS address,
    CITY AS city,
    COUNTRY AS country,
    STATUS AS status,
    CREATED_DATE AS created_date
FROM {{ source('bronze','SUPPLIER_RAW') }}
