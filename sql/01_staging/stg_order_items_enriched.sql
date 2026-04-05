WITH order_items_base AS (
  SELECT
    inventory_item_id AS order_item_id,
    order_id,
    user_id,
    product_id,
    status,
    sale_price,
    created_at,
    shipped_at,
    delivered_at,
    returned_at
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
),

products_base AS (
  SELECT
    id AS product_id,
    name AS product_name,
    category,
    department,
    brand,
    retail_price,
    cost
  FROM `bigquery-public-data.thelook_ecommerce.products`
)

SELECT
  oi.order_item_id,
  oi.order_id,
  oi.user_id,
  oi.product_id,

  oi.status,

  oi.created_at,
  DATE(oi.created_at) AS order_date,
  DATE_TRUNC(DATE(oi.created_at), WEEK) AS order_week,
  DATE_TRUNC(DATE(oi.created_at), MONTH) AS order_month,

  oi.shipped_at,
  oi.delivered_at,
  oi.returned_at,

  oi.sale_price,

  p.product_name,
  p.category,
  p.department,
  p.brand,
  p.retail_price,
  p.cost,

  oi.sale_price - p.cost AS gross_margin_estimate,

  DATE_DIFF(DATE(oi.delivered_at), DATE(oi.shipped_at), DAY) AS shipped_to_delivered_days,

  CASE
    WHEN oi.returned_at IS NOT NULL THEN 1
    ELSE 0
  END AS is_returned,

  CASE
    WHEN oi.delivered_at IS NOT NULL THEN 1
    ELSE 0
  END AS is_delivered

FROM order_items_base oi
LEFT JOIN products_base p
  ON oi.product_id = p.product_id;