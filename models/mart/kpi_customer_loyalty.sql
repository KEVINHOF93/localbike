with customer_orders as (
    select 
        customer_id,
        count(order_id) as total_orders
    from {{ ref('stg_orders') }}
    group by customer_id
)
select 
    avg(total_orders) as avg_orders_per_customer
from customer_orders