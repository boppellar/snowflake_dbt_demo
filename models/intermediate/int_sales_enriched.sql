{{ config(materialized="view") }}

select

    oh.order_id,
    oh.order_date,
    oh.order_status,

    c.customer_id,
    c.first_name,
    c.last_name,

    ol.product_id,
    p.product_name,
    p.category,

    ol.quantity,
    ol.unit_price,
    ol.discount,
    ol.tax_amount,
    ol.line_total,

    pay.payment_method,
    pay.payment_status

from {{ ref("stg_order_header") }} oh

inner join {{ ref("stg_customer") }} c on oh.customer_id = c.customer_id

inner join {{ ref("stg_order_line") }} ol on oh.order_id = ol.order_id

inner join {{ ref("stg_product") }} p on ol.product_id = p.product_id

left join {{ ref("stg_payment") }} pay on oh.order_id = pay.order_id
