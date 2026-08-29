with source as (

    select * from {{ source('competitor_raw', 'raw_competitor_rates') }}

),

renamed as (

    select
        competitor_name,
        upper(state_code)     as state_code,
        product_line,
        rate_change_pct,
        quote_premium,
        effective_date,
        load_timestamp
    from source

)

select * from renamed
