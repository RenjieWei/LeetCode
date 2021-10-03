# solution 1 - complicated 
SELECT
  customer_id,
  name
FROM (
    SELECT
    o.customer_id,
    c.name AS name,
    MONTH(o.order_date) AS order_month,
    SUM(quantity * price) AS sum_price_of_product
FROM 
    Orders o 
INNER JOIN 
    Product p 
ON o.product_id = p.product_id
INNER JOIN 
    Customers c 
ON o.customer_id = c.customer_id
WHERE
    YEAR(o.order_date) = 2020
    AND MONTH(o.order_date) IN (6,7)
GROUP BY
    o.customer_id,
    MONTH(o.order_date) 
HAVING 
    sum_price_of_product >= 100
) temp 
GROUP BY 
    customer_id
HAVING 
    COUNT(*) = 2
;
# solution 2
# GROUP BY + HAVING + IF(xx, xx, xx)
SELECT
    o.customer_id,
    c.name 
FROM 
    Orders o
INNER JOIN 
    Product p 
ON o.product_id = p.product_id
INNER JOIN 
    Customers c
ON o.customer_id = c.customer_id
GROUP BY 
    o.customer_id
HAVING 
    SUM(IF(LEFT(o.order_date,7) = '2020-06',o.quantity*p.price,0)) >= 100
    AND SUM(IF(LEFT(o.order_date,7) = '2020-07',o.quantity*p.price,0)) >= 100
    
;

