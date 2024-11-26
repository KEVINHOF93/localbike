with raw_order_items as (
    select 
        order_id,
        item_id,
        product_id,
        quantity,
        list_price,
        discount
    from {{ source('local_bike', 'order_items') }}
)
select 
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    (list_price - discount) as effective_price
from raw_order_items