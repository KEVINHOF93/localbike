with delivery_metrics as (
    select 
        store_id,
        count(order_id) as total_orders,
        sum(on_time_delivery) as on_time_orders
    from {{ ref('stg_orders') }}
    where shipped_date is not null
    group by store_id
)
select 
    store_id,
    total_orders,
    on_time_orders,
    on_time_orders * 1.0 / total_orders as on_time_delivery_rate
from delivery_metrics