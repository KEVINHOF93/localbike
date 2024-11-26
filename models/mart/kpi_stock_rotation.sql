select 
    store_id,
    product_id,
    stock_rotation
from {{ ref('int_stock_rotation') }}