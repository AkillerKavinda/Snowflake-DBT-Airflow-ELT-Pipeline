select
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERSTATUS as order_status,
    O_TOTALPRICE as total_price,
    O_ORDERDATE as order_date

from {{ source('tpch', 'ORDERS') }}