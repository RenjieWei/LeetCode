# Solution 1 - window function: LAG
SELECT
    Id
FROM
    (SELECT
        Id,
        Temperature,
        RecordDate,
        LAG(Temperature, 1) OVER (ORDER BY RecordDate)  AS Prior_Temperature,
        LAG(RecordDate, 1) OVER (ORDER BY RecordDate)  AS Prior_Date
    FROM 
        Weather
    ) temp
WHERE 
    Temperature > Prior_Temperature
    AND DATEDIFF(RecordDate, Prior_Date) = 1
;

# Solution 2 - join on (key = key - 1)
# Date type: Use datediff instead of date + num..
SELECT
    w1.Id
FROM 
    Weather w1
INNER JOIN 
    Weather w2
ON 
DATEDIFF(w1.recordDate, w2.recordDate) = 1
# Not work: w1.RecordDate = w2.RecordDate+1
WHERE
    w1.Temperature > w2.Temperature
;
    
