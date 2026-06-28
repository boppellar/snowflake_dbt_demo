{{ config(
    materialized='view'
) }}

SELECT

    oh.order_id,
    oh.order_date,
    oh.order_status,
    oh.total_amount,

    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,
    c.country

FROM {{ ref('stg_order_header') }} AS oh

INNER JOIN {{ ref('stg_customer') }} AS c
    ON oh.customer_id = c.customer_id