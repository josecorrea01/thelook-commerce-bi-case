WITH stg_order_items_enriched AS (
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
    DATE(oi.created_at) AS order_date,
    oi.sale_price,
    p.product_name,
    p.category,
    p.department,
    p.brand,
    p.retail_price,
    p.cost
  FROM order_items_base oi
  LEFT JOIN products_base p
    ON oi.product_id = p.product_id
),

category_product_base AS (
  SELECT
    category,
    product_name,
    SUM(sale_price) AS product_revenue,
    COUNT(*) AS product_order_item_count
  FROM stg_order_items_enriched
  GROUP BY category, product_name
),

category_totals AS (
  SELECT
    category,
    SUM(product_revenue) AS category_revenue,
    SUM(product_order_item_count) AS category_order_item_count
  FROM category_product_base
  GROUP BY category
),

grand_total AS (
  SELECT
    SUM(category_revenue) AS total_revenue_all_categories
  FROM category_totals
)

SELECT
  cpb.category,
  cpb.product_name,
  ct.category_revenue,
  ct.category_order_item_count,
  cpb.product_revenue,
  cpb.product_order_item_count,
  SAFE_DIVIDE(ct.category_revenue, gt.total_revenue_all_categories) AS category_revenue_share,
  ROW_NUMBER() OVER (
    PARTITION BY cpb.category
    ORDER BY cpb.product_revenue DESC
  ) AS product_rank_in_category
FROM category_product_base cpb
JOIN category_totals ct
  ON cpb.category = ct.category
CROSS JOIN grand_total gt
ORDER BY ct.category_revenue DESC, product_rank_in_category ASC;