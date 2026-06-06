 select
    c.customer_id,
    c.customer_name,
    c.city,

    a.account_id,
    a.account_type,

    t.transaction_id,
    t.amount,
    t.transaction_date

from {{ ref('stg_customers') }} c

inner join {{ ref('stg_account') }} a
    on c.customer_id = a.customer_id

inner join {{ ref('stg_transactions') }} t
    on a.account_id = t.account_id