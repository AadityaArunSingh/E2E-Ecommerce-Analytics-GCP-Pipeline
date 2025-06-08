WITH centers AS (
  SELECT DISTINCT name AS distribution_center_name
  FROM `cc-coursework-456415.thelook.distribution_centers`
),
categories AS (
  SELECT DISTINCT category AS product_category
  FROM `cc-coursework-456415.thelook.products`
),
all_pairs AS (
  SELECT 
    c.distribution_center_name, 
    cat.product_category
  FROM centers c
  CROSS JOIN categories cat
),
actual_pairs AS (
  SELECT DISTINCT
    dc.name AS distribution_center_name,
    p.category AS product_category
  FROM `cc-coursework-456415.thelook.order_items` oi
  JOIN `cc-coursework-456415.thelook.inventory_items` i
    ON oi.inventory_item_id = i.id
  JOIN `cc-coursework-456415.thelook.products` p
    ON oi.product_id = p.id
  JOIN `cc-coursework-456415.thelook.distribution_centers` dc
    ON i.product_distribution_center_id = dc.id
  WHERE oi.status = 'Shipped'
)
SELECT 
  ap.distribution_center_name,
  ap.product_category
FROM all_pairs ap
LEFT JOIN actual_pairs act
  ON ap.distribution_center_name = act.distribution_center_name
 AND ap.product_category = act.product_category
WHERE act.distribution_center_name IS NULL
ORDER BY ap.distribution_center_name, ap.product_category;
