select customer_id,upper(customer_name) as customer_name,upper(city) as city,lower(email) as email from {{ source('raw','customers') }}
