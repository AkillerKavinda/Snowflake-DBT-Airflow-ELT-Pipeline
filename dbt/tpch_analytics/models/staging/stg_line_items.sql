select
    L_ORDERKEY as order_id,
    L_PARTKEY as part_id,
    L_SUPPKEY as supplier_id,
    L_LINENUMBER as line_number,
    L_QUANTITY as quantity,
    L_EXTENDEDPRICE as extended_price,
    L_DISCOUNT as discount_percentage,
    L_TAX as tax_percentage,
    L_RETURNFLAG as return_flag,
    L_LINESTATUS as line_status,
    L_SHIPDATE as ship_date,
    L_COMMITDATE as commit_date,
    L_RECEIPTDATE as receipt_date

from {{ source('tpch', 'LINEITEM') }}