with brand_revenue as (
    select 
        p.brand_id,
        date_trunc('month', o.order_date) as month,
        sum(i.quantity * (i.list_price - i.discount)) as total_revenue
    from {{ ref('stg_order_items') }} i
    join {{ ref('stg_products') }} p
    on i.product_id = p.product_id
    join {{ ref('stg_orders') }} o
    on i.order_id = o.order_id
    group by p.brand_id, date_trunc('month', o.order_date)
)
select 
    brand_id,
    month,
    total_revenue,
    total_revenue - lag(total_revenue) over (partition by brand_id order by month) as revenue_growth
from brand_revenue