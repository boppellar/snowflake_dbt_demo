{{ config(
    materialized='view'
) }}

SELECT

    CUSTOMER_ID      AS customer_id,
    FIRST_NAME       AS first_name,
    LAST_NAME        AS last_name,
    EMAIL            AS email,
    PHONE            AS phone,
    DOB              AS dob,
    GENDER           AS gender,
    ADDRESS          AS address,
    CITY             AS city,
    STATE            AS state,
    COUNTRY          AS country,
    POSTAL_CODE      AS postal_code,
    CREATED_DATE     AS created_date,
    UPDATED_DATE     AS updated_date,
    STATUS           AS status

FROM {{ source('bronze','CUSTOMER_RAW') }}
