with base as (

    select * from {{ ref('int_pricing_vs_competitor') }}

)

select
    indication_id,
    state_code,
    product_line,
    indicated_rate_change_pct,
    avg_competitor_rate_change_pct,
    avg_competitor_premium,
    rate_gap_vs_competitor_pct,
    case
        when rate_gap_vs_competitor_pct > 0 then 'Above Market'
        when rate_gap_vs_competitor_pct < 0 then 'Below Market'
        else 'At Market'
    end as market_position,
    effective_date,
    filed_date
from base