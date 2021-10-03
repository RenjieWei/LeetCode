# Write your MySQL query statement below
SELECT
    Id,
    Company,
    Salary
FROM 
    (SELECT
        Id,
        Company,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) AS r_num,
        COUNT(*) OVER (PARTITION BY Company) AS cnt
    FROM 
        Employee
    ) temp 
WHERE
    r_num BETWEEN cnt/2  AND cnt/2 + 1

;


