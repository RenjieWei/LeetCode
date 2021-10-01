# Write your MySQL query statement below
# solution 1 - join by keys, keys-1, keys-2
# slower but memory usage is 0
SELECT
    DISTINCT l3.Num AS ConsecutiveNums
FROM logs l1
INNER JOIN logs l2 
    ON l1.Id = l2.Id-1
INNER JOIN logs l3 
    ON l2.Id = l3.Id-1
WHERE 
    l1.Num = l2.Num
    AND l2.Num = l3.Num
;

# Write your MySQL query statement below
# solution 2 - catersian join - faster
SELECT
    DISTINCT l3.Num AS ConsecutiveNums
FROM 
    logs l1,
    logs l2,
    logs l3 
WHERE 
    l1.Id = l2.Id -1
    AND l2.Id = l3.id -1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;
    

