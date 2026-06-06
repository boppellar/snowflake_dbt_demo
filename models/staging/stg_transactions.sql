select transaction_id,account_id,cast(amount as number(18,2))as amount,cast(transaction_date as date)
 as transaction_date from {{ source('raw','transactions') }}
where transaction_id is not null and account_id is not null and amount >0
qualify row_number() over (
    partition by transaction_id
    order by transaction_date desc
) = 1