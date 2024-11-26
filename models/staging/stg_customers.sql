with raw_customers as (
    select 
        customer_id,
        city,
        state
    from {{ source('localbike', 'customers') }}
)
select 
    customer_id,
    city,
    state
from raw_customers