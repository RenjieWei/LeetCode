# Write your MySQL query statement below
SELECT
    task_status AS period_state,
    MIN(status_date) AS start_date,
    MAX(status_date) AS end_date
FROM 
(
    SELECT
        task_status,
        status_date,
        (RANK() OVER (ORDER BY status_date) - rnk) AS delta
    FROM
        (
        SELECT
            fail_date AS status_date,
            "failed" AS task_status,
            RANK() OVER (ORDER BY fail_date) AS rnk
        FROM failed 
        WHERE YEAR(fail_date) = 2019

        UNION 

        SELECT
            success_date AS status_date,
            "succeeded" AS task_status,
            RANK() OVER (ORDER BY success_date) AS rnk
        FROM Succeeded 
        WHERE YEAR(success_date) = 2019        
        ) temp1
) temp2
GROUP BY
    delta,
    period_state
ORDER BY   
    status_date
;
