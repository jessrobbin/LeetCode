-- Write your PostgreSQL query statement below
with ranked_users as (
    select 
    u.name as results
    from MovieRating R
    left join Users u on u.user_id = r.user_id
    group by u.name
    order by count(r.movie_id) desc, u.name asc
    limit 1
)
, movie_ratings as(
    select 
    m.title as results
    from MovieRating r
    left join Movies m on m.movie_id = r.movie_id
    where R.created_at <= '2020-02-28' AND R.created_at >= '2020-02-01'
    group by m.title
    order by avg(r.rating) desc, m.title asc
    limit 1
)
select results from ranked_users
union all
select results from movie_ratings
