select
    customers.market_segment,

    count(distinct orders.order_id) as total_orders,
    count(distinct orders.customer_id) as total_customers,
    sum(orders.total_quantity) as total_quantity,
    sum(orders.gross_revenue) as gross_revenue,
    sum(orders.total_discount) as total_discount,
    sum(orders.net_revenue) as net_revenue

from {{ ref('fact_orders') }} as orders

left join {{ ref('dim_customers') }} as customers
    on orders.customer_id = customers.customer_id

group by customers.market_segment