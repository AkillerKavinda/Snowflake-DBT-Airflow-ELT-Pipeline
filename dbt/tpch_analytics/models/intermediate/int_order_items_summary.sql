select
    order_id,
    sum(quantity) as total_quantity,
    sum(extended_price) as gross_revenue,
    sum(extended_price * discount_percentage) as total_discount,
    sum(extended_price * (1 - discount_percentage)) as net_revenue,
    avg(discount_percentage) as average_discount_percentage

from {{ ref('stg_line_items') }}

group by order_id