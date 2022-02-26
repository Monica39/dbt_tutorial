
--This test validates that the first order date is not greater than the most recent order date.

select
customer_id,
first_order_date 
from {{ ref('customers' )}}
where first_order_date > most_recent_order_date