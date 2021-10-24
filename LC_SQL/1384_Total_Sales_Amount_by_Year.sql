# Write your MySQL query statement below
SELECT
    temp.product_id,
    p.product_name,
    temp.report_year,
    temp.total_amount
FROM 
(SELECT
    product_id,
    '2018' AS report_year,
    (DATEDIFF(LEAST('2018-12-31',period_end), GREATEST('2018-01-01',period_start))+1)*average_daily_sales AS total_amount
FROM Sales 
WHERE YEAR(period_start) = 2018
UNION
SELECT
    product_id,
    '2019' AS report_year,
    (DATEDIFF(LEAST('2019-12-31',period_end), GREATEST('2019-01-01',period_start))+1)*average_daily_sales AS total_amount 
FROM Sales
WHERE YEAR(period_start) <= 2019 AND YEAR(period_end) >= 2019
UNION
SELECT
    product_id,
    '2020' AS report_year,
    (DATEDIFF(LEAST('2020-12-31',period_end), GREATEST('2020-01-01',period_start))+1)*average_daily_sales AS total_amount 
FROM Sales
WHERE YEAR(period_end) = 2020
) temp 
INNER JOIN  
    Product p 
ON temp.product_id = p.product_id
ORDER BY 
    product_id,
    report_year
;

    
