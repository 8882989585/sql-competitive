/**
https://leetcode.com/problems/trips-and-users/description/
 */
with recursive
    cte as (select cast('2013-10-01' as date) as cal
            union
            select date_add(cal, interval 1 day)
            from cte
            where cal < cast('2013-10-03' as date)),
    cte1 as (select id, status, request_at
             from Trips t
                      join Users u on t.client_id = u.users_id
             where u.banned = 'No'),
    cte2 as (select id, status, request_at
             from Trips t
                      join Users u on t.driver_id = u.users_id
             where u.banned = 'No'),
    cte3 as (select c1.status, c1.request_at, count(*) as cc
             from cte1 c1
                      join cte2 c2 on c1.id = c2.id
             group by c1.status, c1.request_at),
    cte4 as (select cal,
                    sum(case when status = 'completed' then cc else 0 end)  as done,
                    sum(case when status != 'completed' then cc else 0 end) as cnl
             from cte3 c3
                      right join cte c on c3.request_at = c.cal
             group by cal),
    cte5 as (select cal as "Day", case when cnl = 0 then 0 else round(cnl / (cnl + done), 2) end as "Cancellation Rate"
             from cte4)
select *
from cte5
order by "Day";

-- replace right join with join in cte4 for answering the actual question on leetcode.