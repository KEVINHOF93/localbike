with revenue_per_order as (
    select 
        o.store_id,
        o.order_id,
        sum(i.quantity * (i.list_price - i.discount)) as order_revenue
    from {{ ref('stg_order_items') }} i
    join {{ ref('stg_orders') }} o
    on i.order_id = o.order_id
    group by o.store_id, o.order_id
)
select 
    store_id,
    avg(order_revenue) as avg_basket_value
from revenue_per_order
group by store_id