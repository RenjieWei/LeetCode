-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more
-- than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a 
-- full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

select h.hacker_id,h.name
from Submissions as s
join Hackers as h
on s.hacker_id = h.hacker_id
join Challenges as c
on s.challenge_id = c.challenge_id
join Difficulty as d
on c.difficulty_level = d.difficulty_level
where s.score = d.score 
group by h.hacker_id, h.name
having count(*)> 1
order by count(*) desc, h.hacker_id;

-- Notes:
-- Identify the primary key and foreign key
-- Identify the join order 
-- The table with the most information as the first join 
-- group by XX having count(*) > 1
