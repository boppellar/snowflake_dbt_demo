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
    updated_date

FROM {{ ref('stg_customer') }}