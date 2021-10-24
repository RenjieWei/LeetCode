# Write your MySQL query statement below
SELECT
    DISTINCT 
    c1.seat_id
FROM 
    cinema c1
LEFT JOIN 
    cinema c2
ON c1.seat_id = c2.seat_id - 1
OR c1.seat_id = c2.seat_id +1 
WHERE
    c1.free = 1 AND c2.free = 1
ORDER BY 
    seat_id
;
