SELECT
  COUNT(*) AS total_order_items,
  COUNTIF(product_id IS NULL) AS null_product_id,
  COUNTIF(p.id IS NULL) AS unmatched_products
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id;