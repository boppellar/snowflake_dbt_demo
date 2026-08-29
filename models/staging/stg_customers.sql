{{ config(
    materialized='table',
    transient=false,
    alias='mart_customers'
) }}

with stg_customers as (
    select * from {{ source('customers', 'customers') }}
),

final_table as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        city,
        state,
        signup_date
    from stg_customers
)

select * from final_table