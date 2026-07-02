{{ config(
    materialized='view'
) }}

SELECT

    CUSTOMER_ID      AS customer_id,
    {{ clean_text('first_name') }} AS first_name,
    {{ clean_text('last_name') }} AS last_name,
    EMAIL            AS email,
    PHONE            AS phone,
    DOB              AS dob,
    GENDER           AS gender,
    ADDRESS          AS address,
    {{ clean_text('city') }} AS city,
    {{ clean_text('state') }} AS state,
    {{ clean_text('country') }} AS country,
    POSTAL_CODE      AS postal_code,
    CREATED_DATE     AS created_date,
    UPDATED_DATE     AS updated_date,
    STATUS           AS status
    age              as age

FROM {{ source('bronze','CUSTOMER_RAW') }}

WHERE CREATED_DATE >= DATEADD(
    day,
    -{{ var('load_days') }},
    CURRENT_DATE()
)