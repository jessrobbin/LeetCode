# Write your MySQL query statement below

with first_orders as(
select 
customer_id
, min(order_date) as first_order
from Delivery
group by customer_id
)

select
round((sum(if(d.order_date = d.customer_pref_delivery_date, 1, 0)) / count(d.customer_id))*100,2) as immediate_percentage 
from Delivery d
join first_orders fo on fo.customer_id = d.customer_id 
where d.order_date = fo.first_order