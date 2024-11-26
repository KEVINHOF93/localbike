with raw_stocks as (
    select 
        store_id,
        product_id,
        quantity as current_stock
    from {{ source('local_bike', 'stocks') }}
)
select * 
FROM raw_stocks