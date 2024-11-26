with raw_staffs as (
    select 
        staff_id,
        active,
        store_id,
        manager_id
    from {{ source('local_bike', 'staffs') }}
)
select 
    staff_id,
    cast(active as boolean) as is_active,
    store_id,
    manager_id
from raw_staffs