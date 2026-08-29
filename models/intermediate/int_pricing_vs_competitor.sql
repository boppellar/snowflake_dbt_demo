with pricing as (

    select * from {{ ref('stg_pricing_indications') }}

),

competitor as (

    select
        state_code,
        product_line,
        avg(rate_change_pct)  as avg_competitor_rate_change_pct,
        avg(quote_premium)     as avg_competitor_premium
    from {{ ref('stg_competitor_rates') }}
    group by 1, 2

),

joined as (

    select
        p.indication_id,
        p.state_code,
        p.product_line,
        p.indicated_rate_change_pct,
        c.avg_competitor_rate_change_pct,
        c.avg_competitor_premium,
        p.indicated_rate_change_pct - c.avg_competitor_rate_change_pct as rate_gap_vs_competitor_pct,
        p.effective_date,
        p.filed_date
    from pricing p
    left join competitor c
        on p.state_code = c.state_code
        and p.product_line = c.product_line

)

select * from joined