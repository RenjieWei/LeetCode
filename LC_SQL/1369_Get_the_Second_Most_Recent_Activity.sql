# Write your MySQL query statement below
# SELECT rnk = 2 when cnt != 1
# USE window function to get both rank and cnt for each group
SELECT
    temp.username,
    temp.activity,
    temp.startDate,
    temp.endDate
FROM 
(
SELECT
    username,
    activity,
    startDate,
    endDate,
    RANK() OVER (PARTITION BY username ORDER BY startDate DESC) AS rnk,
    COUNT(*) OVER (PARTITION BY username) AS cnt
FROM 
    UserActivity
) temp 
WHERE
    temp.cnt = 1
    OR temp.rnk = 2
;
