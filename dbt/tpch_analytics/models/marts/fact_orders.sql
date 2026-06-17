select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_date,
    orders.total_price,

    order_summary.total_quantity,
    order_summary.gross_revenue,
    order_summary.total_discount,
    order_summary.net_revenue,
    order_summary.average_discount_percentage

from {{ ref('stg_orders') }} as orders

left join {{ ref('int_order_items_summary') }} as order_summary
    on orders.order_id = order_summary.order_id