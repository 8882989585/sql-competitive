/**
https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/description/?envType=study-plan-v2&envId=premium-sql-50
 */
with cte as (select customer_id,
                    max(case when product_name = 'A' then 1 else 0 end) as pa,
                    max(case when product_name = 'B' then 1 else 0 end) as pb,
                    max(case when product_name = 'C' then 1 else 0 end) as pc
             from Orders
             group by customer_id)
select c.*
from Customers c
         join cte c1 on c.customer_id = c1.customer_id
where pa = 1
  and pb = 1
  and pc = 0
order by c.customer_id; 