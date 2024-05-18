/**
https://leetcode.com/problems/calculate-special-bonus/description/?envType=study-plan-v2&envId=premium-sql-50
 */
select employee_id, case when employee_id % 2 = 1 and substr(name, 1, 1) != 'M' then salary else 0 end as bonus
from Employees
order by employee_id;