# Write your MySQL query statement below

-- #Asigned 10 as price with products only changed after 16th
select 
distinct product_id
, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16'

UNION


select
product_id
, new_price
from products
where (product_id, change_date) in 

#Filters rows to where the id/date combo appears in the id, max date table below
    (select
        product_id
        , max(change_date) as max_change_date
    from products
    where change_date <= '2019-08-16'
    group by product_id
        )