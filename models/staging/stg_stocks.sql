with raw_stocks as (
    select 
        store_id,
        product_id,
        quantity as current_stock
    from {{ source('localbike', 'stocks') }}
)
select * from raw_stocks