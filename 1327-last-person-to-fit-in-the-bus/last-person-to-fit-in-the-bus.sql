# Write your MySQL query statement below
WITH running_total AS (
    SELECT 
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS running_weight
    FROM Queue
)
, total_on_bus as (
SELECT *
, max(turn) over () as people_on_bus
FROM running_total
where running_weight <= 1000
)

select
    person_name
from total_on_bus 
where turn = people_on_bus
