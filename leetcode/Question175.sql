/**
https://leetcode.com/problems/combine-two-tables/description/?envType=study-plan-v2&envId=premium-sql-50
 */
select firstName,lastName,city,state from Person p left join Address a using (personId);