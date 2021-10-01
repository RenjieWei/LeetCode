# Write your MySQL query statement below
# Window function - dense rank
SELECT
    Department,
    Employee,
    Salary
FROM 
    (
        SELECT 
            d.Name AS Department,
            e.Name AS Employee,
            e.Salary AS Salary,
            DENSE_RANK() OVER (PARTITION BY d.Id ORDER BY e.Salary DESC) AS rnk
        FROM 
            Employee e
        INNER JOIN 
            Department d
        ON e.DepartmentId = d.Id
    ) temp
WHERE rnk <= 3
;
