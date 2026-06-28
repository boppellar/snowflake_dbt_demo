{{ config(
    materialized='table'
) }}

SELECT

    {{ dbt_utils.generate_surrogate_key(['employee_id']) }} AS employee_sk,

    employee_id,
    first_name,
    last_name,
    email,
    phone,
    job_title,
    hire_date,
    salary,
    status

FROM {{ ref('stg_employee') }}