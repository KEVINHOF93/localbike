with revenue_per_staff as (
    select 
        o.store_id,
        o.staff_id,
        sum(i.quantity * (i.list_price - i.discount)) as total_revenue
    from {{ ref('stg_order_items') }} i
    join {{ ref('stg_orders') }} o
    on i.order_id = o.order_id
    group by o.store_id, o.staff_id
)
select 
    store_id,
    staff_id,
    total_revenue
from revenue_per_staff