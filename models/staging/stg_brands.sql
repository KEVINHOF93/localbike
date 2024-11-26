with raw_brands as (
    select 
        brand_id
    from {{ source('local_bike', 'brands' }}
)
select 
    brand_id
from raw_brands