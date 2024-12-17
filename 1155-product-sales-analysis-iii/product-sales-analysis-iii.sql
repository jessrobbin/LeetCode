-- Write your PostgreSQL query statement below
-- select
-- product_id
-- , year as first_year
-- , quantity
-- , price
-- from Sales
-- where (product_id, year) in (
--     select
--         product_id
--         , min(year) over (partition by product_id) as year
--     from Sales
-- )

with cte as (
    select
    product_id
    , min(year) as first_year
    from Sales
    group by product_id
)
select
    s.product_id
    , s.year as first_year
    , s.quantity
    , s.price
from Sales s
where (s.product_id, s.year) IN 
    ( select
        product_id
        , first_year as year
        from cte) 
