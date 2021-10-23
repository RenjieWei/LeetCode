# Write your MySQL query statement below
# GROUP BY (id- rank) 
WITH long_contests AS (
    SELECT
        contest_id,
        gold_medal AS user_id
    FROM Contests
    UNION
    SELECT
        contest_id,
        silver_medal AS user_id
    FROM Contests
    UNION
    SELECT
        contest_id,
        bronze_medal AS user_id
    FROM contests
),
t1 as (
    select 
        user_id, 
        contest_id, 
        row_number() over(partition by user_id order by contest_id) as rn 
    from long_contests
    ),
result_table AS (
    SELECT
        user_id
    FROM 
        t1
    GROUP BY 
        user_id, contest_id - rn
    HAVING COUNT(*) >= 3
    UNION 
    SELECT
        gold_medal AS user_id
    FROM Contests
    GROUP BY 
        user_id
    HAVING COUNT(*) >= 3
)

SELECT
    name,
    mail
FROM 
    result_table r 
LEFT JOIN 
    Users u ON r.user_id = u.user_id
;
