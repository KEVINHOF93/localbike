with raw_products as (
    select 
        product_id,
        brand_id,
        category_id,
        model_year,
        list_price
    from {{ source('local_bike', 'products') }}
)
select 
    product_id,
    brand_id,
    category_id,
    model_year,
    list_price
from raw_products