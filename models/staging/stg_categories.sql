with raw_categories as (
    select 
        category_id,
        category_name
    from {{ source('local_bike', 'categories') }}
)
select 
    category_id,
    category_name,
from raw_categories