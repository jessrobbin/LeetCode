# Write your MySQL query statement below
with confirmed_messages as (
select 
user_id
, count(user_id) as confirmed_count
from Confirmations 
where action = "confirmed"
group by user_id)

,conf_rate as (
select 
c.user_id
, (cm.confirmed_count/count(c.action)) as confirmation_rate
from Confirmations c
left join confirmed_messages cm on c.user_id=cm.user_id 
group by user_id)

select
s.user_id
, round(ifnull(conf_rate.confirmation_rate, 0),2) as confirmation_rate
from Signups s
left join conf_rate on conf_rate.user_id = s.user_id

