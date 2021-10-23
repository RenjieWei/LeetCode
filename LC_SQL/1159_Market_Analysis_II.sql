# Write your MySQL query statement below
SELECT
    u.user_id AS seller_id,
    CASE 
        WHEN u.favorite_brand = temp2.item_brand THEN 'yes'
        ELSE 'no'
    END AS 2nd_item_fav_brand
    
FROM Users u 
LEFT JOIN 
(    SELECT
        seller_id AS user_id,
        item_brand
    FROM 
    (
        SELECT 
            seller_id,
            RANK() OVER (PARTITION BY seller_id ORDER BY order_date) 
                AS rnk,
            i.item_brand
        FROM 
            Orders o 
        LEFT JOIN 
            Items i 
        ON o.item_id = i.item_id
    ) temp 
    WHERE rnk = 2
) temp2 

on temp2.user_id = u.user_id
;
