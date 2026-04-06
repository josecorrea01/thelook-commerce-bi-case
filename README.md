# thelook-commerce-bi-case

Mini end-to-end BI and data modeling case built on top of the public **theLook eCommerce** dataset in **BigQuery**.

---

## Overview

This project transforms raw e-commerce data into curated analytical assets that support business monitoring and decision-making.

The solution follows a small but realistic analytics workflow:

- source exploration and validation
- enriched staging layer
- business-oriented marts
- conceptual semantic layer in LookML

The focus is on commercial performance and reusable BI-oriented structures.

---

## Business Context

E-commerce teams usually have access to raw transactional data, but decision-making often depends on curated analytical layers that make business metrics easier to consume and interpret.

This case addresses that need by building a compact analytical foundation centered on:

- daily revenue evolution
- category contribution to total sales
- top-performing products inside each category
- reusable structures that can support downstream BI consumption

---

## Key Business Questions

1. How is daily revenue evolving over time?
2. Which categories contribute the most to total revenue?
3. Which products are top performers inside each category?
4. How can raw transactional data be transformed into cleaner, business-ready analytical assets?

---

## Dataset

Source tables:

- `bigquery-public-data.thelook_ecommerce.order_items`
- `bigquery-public-data.thelook_ecommerce.products`

Environment:

- Google BigQuery
- GoogleSQL
- Public dataset in region **US**

---

## Project Structure

```text
thelook-commerce-bi-case/
├── README.md
├── docs/
│   └── screenshots/
├── sql/
│   ├── 00_exploration/
│   ├── 01_staging/
│   ├── 02_marts/
│   └── 03_analysis/
└── lookml/

```

## Analytical Approach

### 1. Exploration

The project starts with source validation on the public dataset.

Main checks included:

- table discovery
- schema inspection
- sample data review
- join quality validation between `order_items` and `products`

This step ensured that the analytical model would be built on top of a reliable base.


### 2. Staging Layer

**File:** `sql/01_staging/stg_order_items_enriched.sql`

This layer creates an enriched order-item-level analytical base by:

- defining grain at **one row per order item**
- standardizing business dates
- enriching transactions with product attributes
- adding derived business fields

Derived fields include:

- `order_date`
- `order_week`
- `order_month`
- `gross_margin_estimate`
- `shipped_to_delivered_days`
- `is_returned`
- `is_delivered`

### 3. Analytical Marts

#### `mart_daily_kpis.sql`

Daily KPI mart for business monitoring.

Main outputs:

- `daily_revenue`
- `daily_order_count`
- `daily_order_item_count`
- `avg_item_price`
- `rolling_7d_revenue`
- `revenue_vs_previous_day`

#### `mart_category_performance.sql`

Category and product performance mart.

Main outputs:

- `category_revenue`
- `category_order_item_count`
- `product_revenue`
- `product_order_item_count`
- `category_revenue_share`
- `product_rank_in_category`

### 4. Semantic Layer Concept

Conceptual LookML files were added to represent how curated outputs could be exposed through a reusable semantic layer.

Files:

- `lookml/ecommerce_case.model.lkml`
- `lookml/daily_kpis.view.lkml`
- `lookml/category_performance.view.lkml`

This layer defines a simple semantic structure with:

- explores
- dimensions
- measures

The goal is to show how analytical outputs could be organized for BI consumption.

## Data Model Logic

### Base Grain

The staging layer is defined at:

- **one row per order item**

### Main Business Date

Primary business date:

- `created_at` → transformed into `order_date`

### Revenue Logic

Base revenue measure:

- `sale_price`

### Category Logic

Category analysis is derived by joining order items with product attributes from `products`.

### Ranking Logic

Product ranking inside each category is calculated with a window function:

- `ROW_NUMBER() OVER (PARTITION BY category ORDER BY product_revenue DESC)`

## SQL Highlights

This case includes:

- CTE-based transformations
- join validation
- staging design
- aggregated marts
- window functions for business analysis

Examples of analytical logic used:

- rolling 7-day revenue
- day-over-day revenue comparison
- product ranking inside category
- category revenue share calculation

## Key Findings

The project produced a compact analytical structure that supports several business views on top of raw transactional data.

Main outcomes include:

- daily revenue can be monitored through a reusable KPI layer
- category contribution can be compared using revenue share
- top-performing products can be identified inside each category
- curated analytical outputs are easier to consume than raw transactional tables
- semantic structures can be defined conceptually on top of curated marts for BI-oriented usage

## Validation Notes

Initial validation confirmed that:

- source tables were available and consistent
- the main join between `order_items` and `products` was valid
- `product_id` nulls were not an issue in the primary join
- the staging output was broadly healthy

A small number of null `product_name` values appeared in staging, but category and revenue fields remained valid for analysis.

## Main Skills Demonstrated

- SQL analytics in BigQuery
- source exploration and schema validation
- join quality checks and sanity validation
- enriched staging layer design
- analytical mart construction
- window functions for trend and ranking logic
- KPI definition from business questions
- semantic modeling concepts with LookML
- technical project documentation

## Current Scope

This version includes:

- source exploration
- schema profiling
- join validation
- staging layer
- daily KPI mart
- category performance mart
- conceptual semantic layer

## Possible Extensions

Near-term extensions:

- shipping performance mart
- materialized curated tables in a private dataset
- dashboard implementation

Longer-term extensions:

- cloud-based BI or API extension on top of curated marts
- additional semantic views and measures
- automated refresh or orchestration layers

## Screenshots

Project screenshots are stored in:

- `docs/screenshots/`

Examples include:

- source table validation
- schema profiling
- staging preview
- mart previews
- semantic layer structure

## How to Reproduce

To reproduce the main workflow:

1. Open BigQuery in region **US**
2. Use the public dataset:
   - `bigquery-public-data.thelook_ecommerce.order_items`
   - `bigquery-public-data.thelook_ecommerce.products`
3. Run the exploration queries from:
   - `sql/00_exploration/`
4. Run the staging query:
   - `sql/01_staging/stg_order_items_enriched.sql`
5. Run the analytical marts:
   - `sql/02_marts/mart_daily_kpis.sql`
   - `sql/02_marts/mart_category_performance.sql`
6. Review the conceptual semantic layer in:
   - `lookml/`
7. Check screenshots under:
   - `docs/screenshots/`

## Notes

This project focuses on building a compact but realistic BI and data modeling workflow on top of a public e-commerce dataset.

The implementation prioritizes:
- clear business questions
- reusable analytical structures
- transparent SQL logic
- lightweight semantic modeling concepts

The goal is to keep the case small enough to understand end-to-end, while still reflecting common patterns found in analytics and BI work.

## Author

José Correa Herrera  
Developer with interest in data modeling, analytics and business intelligence.