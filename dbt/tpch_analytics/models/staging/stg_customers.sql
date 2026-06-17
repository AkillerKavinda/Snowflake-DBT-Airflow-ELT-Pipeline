select
    C_CUSTKEY as customer_id,
    C_NAME as customer_name,
    C_ADDRESS as customer_address,
    C_NATIONKEY as nation_id,
    C_PHONE as phone_number,
    C_ACCTBAL as account_balance,
    C_MKTSEGMENT as market_segment,
    C_COMMENT as customer_comment

from {{ source('tpch', 'CUSTOMER') }}