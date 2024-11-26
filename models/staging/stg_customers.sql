with raw_customers as (
    select 
        customer_id,
        city,
        state
    from {{ source('local_bike', 'customers') }}
)
select 
    customer_id,
    city,
    state
from raw_customers