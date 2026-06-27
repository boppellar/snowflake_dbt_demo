{{ config(materialized='view') }}

SELECT
    EMPLOYEE_ID AS employee_id,
    FIRST_NAME AS first_name,
    LAST_NAME AS last_name,
    EMAIL AS email,
    PHONE AS phone,
    JOB_TITLE AS job_title,
    STORE_ID AS store_id,
    MANAGER_ID AS manager_id,
    HIRE_DATE AS hire_date,
    SALARY AS salary,
    STATUS AS status
FROM {{ source('bronze','EMPLOYEE_RAW') }}
