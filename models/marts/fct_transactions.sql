select
    transaction_id,
    account_id,
    amount,
    transaction_date
from {{ ref('int_customer_transactions') }}