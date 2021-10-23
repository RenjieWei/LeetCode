# Write your MySQL query statement below
WITH temp AS (
    SELECT
        student_id,
        exam_id,
        MAX(score) OVER (PARTITION BY exam_id) AS max_score,
        MIN(score) OVER (PARTITION BY exam_id) AS min_score,
        score
    FROM 
        Exam
)
SELECT
    DISTINCT 
    temp.student_id,
    s.student_name
FROM 
temp
LEFT JOIN 
    Student s 
ON temp.student_id = s.student_id
WHERE 
    temp.student_id NOT IN (SELECT student_id FROM temp where max_score = score or min_score = score)
ORDER BY 
    student_id 
;
