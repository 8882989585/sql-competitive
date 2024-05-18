/**
https://leetcode.com/problems/customers-who-never-order/description/?envType=study-plan-v2&envId=premium-sql-50
 */
with cte as (select distinct customerId as cid from Orders)
select name as Customers from Customers c left join cte o on c.id = o.cid where cid is null;