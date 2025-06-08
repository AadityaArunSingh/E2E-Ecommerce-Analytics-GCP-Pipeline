SELECT
u.country,
u.traffic_source,
COUNT(*) AS user_count,  
SUM(oi.sale_price) AS total_sales  
FROM `cc-coursework-456415.thelook.users` AS u  
JOIN `cc-coursework-456415.thelook.orders` AS o
ON u.id = o.user_id
JOIN `cc-coursework-456415.thelook.order_items` AS oi
ON o.order_id = oi.order_id
WHERE o.status = 'Shipped'  
GROUP BY u.country, u.traffic_source
ORDER BY country DESC;

