{{ config(
    materialized='incremental',
    unique_key='transaction_id',
    incremental_strategy='merge'
) }}

select *
from {{ ref('fct_transactions') }}

{% if is_incremental() %}
where transaction_date > (
    select max(transaction_date)
    from {{ this }}
)
{% endif %}
