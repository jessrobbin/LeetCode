# Write your MySQL query statement below
   with reports_num as (
    select managerID
    , count(managerID) as reporters
    from Employee
    -- where managerID is not null
    group by managerID
   )

   select
   Employee.name
   from Employee
   left join reports_num on reports_num.managerID = Employee.id
    where reports_num.reporters >= 5
