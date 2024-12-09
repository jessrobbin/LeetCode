# Write your MySQL query statement below

SELECT 
    'High Salary' as category
    , count(CASE when income > 50000 then income else null end) as accounts_count
from Accounts

UNION

SELECT 
    'Low Salary' as category
    , count(CASE when income < 20000 then income else null end) as accounts_count
from Accounts

UNION

SELECT 
    'Average Salary' as category
    , count(CASE when income <= 50000 AND income >= 20000 then income else null end) as accounts_count
from Accounts