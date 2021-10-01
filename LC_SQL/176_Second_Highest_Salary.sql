

# Write your MySQL query statement below
# Solution 1:
# For the case that there is no second highest salary, return NULL
SELECT 
    (SELECT
        DISTINCT Salary 
    FROM 
        Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1) 
AS SecondHighestSalary
;

# Solution 2:
# RANK + IFNULL 
SELECT
    IFNULL(
        (SELECT
            DISTINCT 
                Salary
        FROM (
            SELECT 
                Salary,
                RANK() OVER(ORDER BY Salary DESC) AS rnk 
            FROM Employee
        ) temp
        WHERE temp.rnk = 2
        ) , NULL
) AS SecondHighestSalary

;
