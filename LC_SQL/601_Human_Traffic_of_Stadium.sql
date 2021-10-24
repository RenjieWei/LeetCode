# Write your MySQL query statement below
# Solution 1 - UNION 
WITH temp AS
(
    SELECT
    s1.id AS s1_id,
    s1.visit_date AS s1_visit_date,
    s1.people AS s1_people,
    s2.id AS s2_id,
    s2.visit_date AS s2_visit_date,
    s2.people AS s2_people,
    s3.id AS s3_id,
    s3.visit_date AS s3_visit_date,
    s3.people AS s3_people 
FROM 
    Stadium s1 
LEFT JOIN 
    Stadium s2
    ON s1.id = s2.id - 1
LEFT JOIN 
    Stadium s3
    ON s2.id = s3.id - 1
WHERE 
    s1.people >= 100 
    AND s2.people >= 100
    AND s3.people >= 100
) 
SELECT
    * 
FROM 
(
    
SELECT
    s1_id AS id,
    s1_visit_date AS visit_date,
    s1_people AS people
FROM 
    temp 
UNION
SELECT
    s2_id AS id,
    s2_visit_date AS visit_date,
    s2_people AS people
FROM 
    temp 
UNION 
SELECT
    s3_id AS id,
    s3_visit_date AS visit_date,
    s3_people AS people
FROM 
    temp
) temp2
ORDER BY 
    id 
;
