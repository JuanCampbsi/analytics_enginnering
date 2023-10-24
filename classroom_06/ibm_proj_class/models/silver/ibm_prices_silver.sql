with source_ibm_prices as (
    select * from {{ source('ibm_prices_bronze', 'ibm_prices_bronze')}}
),

final as (
    select "datetime"
           , "1. open" as "open"
           , "2. high" as "high"
           , "3. low" as "low"
           , "4. close" as "close"
           , "5. volume" as "volume"
           , ("2. high" - "3. low") as "diff_high_low"
    from source_ibm_prices
)

select * from final


