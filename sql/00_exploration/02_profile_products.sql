SELECT
  column_name,
  data_type
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'products'
ORDER BY ordinal_position;

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;