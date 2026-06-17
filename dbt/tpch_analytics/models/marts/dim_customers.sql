select
    customer_id,
    customer_name,
    customer_address,
    nation_id,
    phone_number,
    account_balance,
    market_segment

from {{ ref('stg_customers') }}