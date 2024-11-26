with raw_staffs as (
    select 
        staff_id,
        active,
        store_id,
        manager_id
    from {{ source('localbike', 'staffs') }}
)
select 
    staff_id,
    active::boolean as is_active, -- Conversion pour faciliter les analyses
    store_id,
    manager_id
from raw_staffs