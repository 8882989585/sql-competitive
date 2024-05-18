/**
https://leetcode.com/problems/find-median-given-frequency-of-numbers/description/
 */
with cte as (select num, sum(frequency) over(partition by null order by num) as cs from Numbers),
     cte1 as (select case when max(cs) % 2 = 0 then max(cs) / 2 else CEIL(max(cs) / 2) end       as m1,
                     case when max(cs) % 2 = 0 then (max(cs) / 2) + 1 else CEIL(max(cs) / 2) end as m2
              from cte),
     cte2 as (select min(cs) as cs
              from cte
              where cs >= (select max(m1) from cte1)
              union all
              select min(cs) as cs
              from cte
              where cs >= (select max(m2) from cte1))
select round(sum(num) / 2, 1) as median
from cte2 c2
         join cte c1 on c2.cs = c1.cs;