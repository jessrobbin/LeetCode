WITH cte AS (
    SELECT
        id,
        num,
        LEAD(num) OVER (ORDER BY id ASC) AS next_num,
        LEAD(num, 2) OVER (ORDER BY id ASC) AS third_num
    FROM Logs
)
SELECT
    cte.num as ConsecutiveNums
FROM cte
WHERE num = next_num AND next_num = third_num
group by cte.num ;
