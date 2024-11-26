with stock_and_revenue as (
    select 
        s.store_id,
        s.product_id,
        s.current_stock,
        coalesce(sum(oi.quantity * (oi.list_price - oi.discount)), 0) as total_sold
    from {{ ref('stg_stocks') }} s
    left join {{ ref('stg_order_items') }} oi
        on s.product_id = oi.product_id
    group by s.store_id, s.product_id, s.current_stock
)
select 
    store_id,
    product_id,
    total_sold / nullif(current_stock, 0) as stock_rotation
from stock_and_revenue