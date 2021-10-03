 # Write your MySQL query statement below
## For those Qs that need to fill NA as a num, do not use where clause to filter
SELECT
    p1.product_id,
    IFNULL(p2.new_price, 10) AS price
FROM    

(SELECT
    DISTINCT product_id
FROM 
    Products) p1
LEFT JOIN 
    (
        SELECT 
            product_id,
            new_price,
            change_date,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rnk
        FROM 
            Products 
        WHERE change_date <= '2019-08-16'
    ) p2
ON p1.product_id = p2.product_id
AND rnk = 1
;
