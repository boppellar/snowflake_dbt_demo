select
    account_id,
    customer_id,
    upper(trim(account_type)) as account_type
from {{ source('raw','accounts') }}
where account_id is not null
  and customer_id is not null
  and upper(trim(account_type)) in ('SAVINGS','CURRENT')

qualify row_number() over (
    partition by account_id
    order by customer_id desc
) = 1