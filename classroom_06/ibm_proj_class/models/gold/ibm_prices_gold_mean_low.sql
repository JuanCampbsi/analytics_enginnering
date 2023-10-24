with source_ibm_prices as (
    select * from {{ source('ibm_prices_silver', 'ibm_prices_silver')}}
),

final as (
    select date("datetime") as "date"
           , avg("high") as "mean_high"

    from source_ibm_prices
    group by date("datetime")
)

select * from final


