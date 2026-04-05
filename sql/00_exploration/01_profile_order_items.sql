SELECT
  column_name,
  data_type
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'order_items'
ORDER BY ordinal_position;


SELECT *
FROM `bigquery-public-data.thelook_ecommerce.order_items`
LIMIT 20;