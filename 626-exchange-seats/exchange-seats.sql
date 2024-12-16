# Write your MySQL query statement below

select
 ( CASE 
    when id = max_id AND mod(id,2) <> 0 then id
    when mod(id,2) = 0 then id -1
    when mod(id,2) <> 0 then id + 1
    else id end
    ) as id
, student
from (
    select 
    id
    , student
    , max(id) over () as max_id
    from Seat
) as sub
order by id