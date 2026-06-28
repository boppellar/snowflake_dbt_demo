{{ config(
    materialized='table'
) }}

SELECT

    customer_id,
    first_name,
    last_name,
    email,
    phone,
    dob,
    gender,
    address,
    city,
    state,
    country,
    postal_code,
    status,
    created_date,
    updated_date

FROM {{ ref('stg_customer') }}
