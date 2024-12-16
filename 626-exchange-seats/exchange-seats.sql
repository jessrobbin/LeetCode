# Write your MySQL query statement below
with all_poss as
(select *
, lead(id) over (order by id) as next_id
, lag(id) over (order by id) as prev_id
, max(id) over () as max_id
from Seat)
, evens as (
    select
    prev_id as id
    , student
    from all_poss
    where mod(id, 2)=0
)
, odds as (
    select
    (case 
        when id = max_id then id 
        else next_id
        end) as id
    , student
    from all_poss
    where mod(id, 2)<>0
)


select * from odds
union all
select * from evens
order by id