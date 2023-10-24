with source_ibm_prices as (
    select * from {{ source('ibm_prices_silver', 'ibm_prices_silver')}}
),

final as (
    select date("datetime") as "date"
           , max("high") as "max_high"
           , min("low") as "min_low"
           , avg("diff_high_low") as "mean_diff_high_low"
    from source_ibm_prices
    group by date("datetime")
)

select * from final


