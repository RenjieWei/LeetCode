# Write your MySQL query statement below
## Having + group by
SELECT
    Email
FROM 
    Person
GROUP BY 
    Email
HAVING COUNT(*) >1
;
