CREATE OR REPLACE TABLE `thelook-bi-practice.thelook_bi_curated.mart_shipping_performance` AS
WITH shipping_base AS (
  SELECT
    order_date,
    order_id,
    shipped_at,
    delivered_at,
    shipped_to_delivered_days
  FROM `thelook-bi-practice.thelook_bi_curated.stg_order_items_enriched`
  WHERE shipped_at IS NOT NULL
    AND delivered_at IS NOT NULL
),

daily_shipping AS (
  SELECT
    order_date,
    COUNT(DISTINCT order_id) AS shipped_orders,
    AVG(shipped_to_delivered_days) AS avg_shipped_to_delivered_days,
    MIN(shipped_to_delivered_days) AS min_shipped_to_delivered_days,
    MAX(shipped_to_delivered_days) AS max_shipped_to_delivered_days
  FROM shipping_base
  GROUP BY order_date
)

SELECT
  order_date,
  shipped_orders,
  avg_shipped_to_delivered_days,
  min_shipped_to_delivered_days,
  max_shipped_to_delivered_days,
  AVG(avg_shipped_to_delivered_days) OVER (
    ORDER BY order_date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS rolling_7d_avg_shipping_days,
  avg_shipped_to_delivered_days - LAG(avg_shipped_to_delivered_days) OVER (
    ORDER BY order_date
  ) AS shipping_days_vs_previous_day
FROM daily_shipping
ORDER BY order_date;