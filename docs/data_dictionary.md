# Data Dictionary

## Source Tables

### `bigquery-public-data.thelook_ecommerce.order_items`
**Grain:** One row per order item.

**Relevant fields:**
- `inventory_item_id`: unique identifier used as order item id
- `order_id`: order identifier
- `user_id`: user identifier
- `product_id`: related product identifier
- `status`: order item status
- `sale_price`: selling price of the item
- `created_at`: order item creation timestamp
- `shipped_at`: shipping timestamp
- `delivered_at`: delivery timestamp
- `returned_at`: return timestamp

### `bigquery-public-data.thelook_ecommerce.products`
**Grain:** One row per product.

**Relevant fields:**
- `id`: product identifier
- `name`: product name
- `category`: product category
- `department`: higher-level product grouping
- `brand`: product brand
- `retail_price`: listed retail price
- `cost`: product cost

## Curated Layer

### `thelook-bi-practice.thelook_bi_curated.stg_order_items_enriched`
**Grain:** One row per order item.

**Purpose:** Curated base layer for downstream analytical marts.

**Main fields:**
- `order_item_id`
- `order_id`
- `user_id`
- `product_id`
- `status`
- `created_at`
- `order_date`
- `order_week`
- `order_month`
- `shipped_at`
- `delivered_at`
- `returned_at`
- `sale_price`
- `product_name`
- `category`
- `department`
- `brand`
- `retail_price`
- `cost`
- `gross_margin_estimate`
- `shipped_to_delivered_days`
- `is_returned`
- `is_delivered`

## Analytical Marts

### `thelook-bi-practice.thelook_bi_curated.mart_daily_kpis`
**Grain:** One row per day.

**Purpose:** Daily business monitoring layer.

**Main fields:**
- `order_date`
- `daily_revenue`
- `daily_order_count`
- `daily_order_item_count`
- `avg_item_price`
- `rolling_7d_revenue`
- `revenue_vs_previous_day`

### `thelook-bi-practice.thelook_bi_curated.mart_category_performance`
**Grain:** One row per category-product combination.

**Purpose:** Category contribution and product ranking analysis.

**Main fields:**
- `category`
- `product_name`
- `category_revenue`
- `category_order_item_count`
- `product_revenue`
- `product_order_item_count`
- `category_revenue_share`
- `product_rank_in_category`

### `thelook-bi-practice.thelook_bi_curated.mart_shipping_performance`
**Grain:** One row per day.

**Purpose:** Shipping and delivery performance monitoring.

**Main fields:**
- `order_date`
- `shipped_orders`
- `avg_shipped_to_delivered_days`
- `min_shipped_to_delivered_days`
- `max_shipped_to_delivered_days`
- `rolling_7d_avg_shipping_days`
- `shipping_days_vs_previous_day`