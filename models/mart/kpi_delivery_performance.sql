select 
    store_id,
    on_time_delivery_rate
from {{ ref('int_delivery_performance') }}