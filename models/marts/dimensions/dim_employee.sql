{{ config(
    materialized='table'
) }}

SELECT

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
