-- This test validates that no order date is recorded for number_of_orders values of 0. 

select
customer_id,
number_of_orders,
first_order_date,
most_recent_order_date
from {{ ref('customers' )}}
where number_of_orders = 0 
and customer_id in 
    (select customer_id from {{ ref('customers' )}}
    where first_order_date is not NULL or most_recent_order_date is not NULL)
