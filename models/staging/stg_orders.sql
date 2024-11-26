with raw_orders as (
    select 
        order_id,
        customer_id,
        order_status,
        order_date,
        required_date,
        shipped_date,
        store_id,
        staff_id
    from {{ source('local_bike', 'orders') }}
)
select 
    *,
    case 
        when shipped_date <= required_date then 1 
        else 0 
    end as on_time_delivery
from raw_orders