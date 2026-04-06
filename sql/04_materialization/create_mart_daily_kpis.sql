CREATE OR REPLACE TABLE `thelook-bi-practice.thelook_bi_curated.mart_daily_kpis` AS
SELECT
  order_date,
  SUM(sale_price) AS daily_revenue,
  COUNT(DISTINCT order_id) AS daily_order_count,
  COUNT(*) AS daily_order_item_count,
  AVG(sale_price) AS avg_item_price,
  SUM(SUM(sale_price)) OVER (
    ORDER BY order_date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS rolling_7d_revenue,
  SUM(sale_price)
    - LAG(SUM(sale_price)) OVER (ORDER BY order_date) AS revenue_vs_previous_day
FROM `thelook-bi-practice.thelook_bi_curated.stg_order_items_enriched`
GROUP BY order_date
ORDER BY order_date;