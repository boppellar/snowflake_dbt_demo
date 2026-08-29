with source as (

    select * from {{ source('pricing_raw', 'raw_pricing_indications') }}

),

renamed as (

    select
        indication_id,
        upper(state_code)              as state_code,
        product_line,
        indicated_rate_change           as indicated_rate_change_pct,
        effective_date,
        filed_date,
        source_system,
        load_timestamp
    from source

)

select * from renamed
