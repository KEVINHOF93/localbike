with product_revenue as (
    select 
        o.store_id,
        i.product_id,
        sum(i.quantity * (i.list_price - i.discount)) as total_revenue
    from {{ ref('stg_order_items') }} i
    join {{ ref('stg_orders') }} o
    on i.order_id = o.order_id
    group by o.store_id, i.product_id
)
select * from product_revenue