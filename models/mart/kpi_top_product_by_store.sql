with ranked_products as (
    select 
        store_id,
        product_id,
        total_revenue,
        rank() over (partition by store_id order by total_revenue desc) as rank
    from {{ ref('int_product_revenue') }}
)
select 
    store_id,
    product_id,
    total_revenue
from ranked_products
where rank = 1