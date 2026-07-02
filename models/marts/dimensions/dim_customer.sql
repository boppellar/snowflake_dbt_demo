{{ config(
    materialized='table'
) }}

SELECT

    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} AS customer_sk,

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
    updated_date,
    age,
CASE
    WHEN age BETWEEN 18 AND 25 THEN 'Young'
    WHEN age BETWEEN 26 AND 40 THEN 'Adult'
    WHEN age BETWEEN 41 AND 60 THEN 'Senior'
    ELSE 'Super Senior'
END AS age_group

FROM {{ ref('stg_customer') }}
