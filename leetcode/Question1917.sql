/**
  https://leetcode.com/problems/leetcodify-friends-recommendations/description/
 */
with A as (select l1.*, l2.user_id as user_id2
           from Listens l1
                    join Listens l2
                         on l1.song_id = l2.song_id and l1.day = l2.day and l1.user_id != l2.user_id), B as (
select user_id, user_id2, day, count (distinct song_id) as cc
from A
group by user_id, user_id2, day),
    C as (
select distinct user_id, user_id2
from B
where cc >= 3)
    , D as (
select c.*
from C c left join Friendship f
on c.user_id = f.user1_id and c.user_id2 = f.user2_id
where f.user1_id is null)
    , E as (
select c.*
from D c left join Friendship f
on c.user_id = f.user2_id and c.user_id2 = f.user1_id
where f.user1_id is null)
select e.user_id as user_id, e.user_id2 as recommended_id
from E;