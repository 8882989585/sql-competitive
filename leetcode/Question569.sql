/**
https://leetcode.com/problems/median-employee-salary/description/
 */
with cte as (select id, company, salary, row_number() over(partition by company order by salary, id) as r_no
             from Employee),
     cte1 as (select max(r_no) as nop, company from cte group by company),
     cte2 as (select c1.*, nop
              from cte c1
                       join cte1 c2 on c1.company = c2.company),
     cte3
         as (select *, case when (nop % 2 = 0 and (r_no = nop / 2 or r_no = (nop / 2)+1)) or (nop % 2 != 0 and r_no = CEIL(nop / 2)) then true else false end as inc
             from cte2)
select id, company, salary
from cte3
where inc = true;