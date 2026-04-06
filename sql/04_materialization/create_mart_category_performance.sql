CREATE OR REPLACE TABLE `thelook-bi-practice.thelook_bi_curated.mart_category_performance` AS
WITH category_product_base AS (
  SELECT
    category,
    product_name,
    SUM(sale_price) AS product_revenue,
    COUNT(*) AS product_order_item_count
  FROM `thelook-bi-practice.thelook_bi_curated.stg_order_items_enriched`
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