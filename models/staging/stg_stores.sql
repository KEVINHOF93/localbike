with raw_stores as (
    select 
        store_id,
        city,
        state
    from {{ source('localbike', 'stores') }}
)
select 
    store_id,
    city,
    state
from raw_stores