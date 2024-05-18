/**
https://leetcode.com/problems/highest-grade-for-each-student/description/?envType=study-plan-v2&envId=premium-sql-50
 */
with cte as (select *, row_number() over(partition by student_id order by grade desc, course_id) as r_no
             from Enrollments)
select student_id, course_id, grade
from cte
where r_no = 1;