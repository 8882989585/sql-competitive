/**
  https://leetcode.com/problems/find-customers-with-positive-revenue-this-year/description/?envType=study-plan-v2&envId=premium-sql-50
 */
select customer_id from Customers where year = 2021 and revenue > 0;