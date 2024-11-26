with raw_brands as (
    select 
        brand_id
    from {{ source('localbike', 'brands') }}
)
select 
    brand_id
from raw_brands