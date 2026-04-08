# Business Case

## Objective

Build a compact end-to-end BI and data modeling case on top of the public **theLook eCommerce** dataset in BigQuery.

The objective is to transform raw transactional data into curated analytical assets that support business monitoring and decision-making.

## Business Context

E-commerce teams usually work with raw operational data, but decision-making becomes much easier when that data is transformed into reusable analytical layers.

This case focuses on building a small analytical foundation that supports:

- daily revenue monitoring
- category contribution analysis
- product performance ranking
- shipping performance monitoring
- reusable BI-oriented outputs

## Key Business Questions

1. How is daily revenue evolving over time?
2. Which categories contribute the most to total revenue?
3. Which products are top performers inside each category?
4. How is shipping performance evolving over time?
5. How can raw transactional tables be transformed into cleaner business-ready analytical structures?

## Analytical Scope

This project includes:

- source validation on public BigQuery tables
- enriched staging design
- analytical marts for business monitoring
- conceptual semantic modeling in LookML
- materialized curated assets in a private dataset

## Output Layers

### Curated base layer
- `stg_order_items_enriched`

### Business marts
- `mart_daily_kpis`
- `mart_category_performance`
- `mart_shipping_performance`

### Semantic layer (conceptual)
- `ecommerce_case.model.lkml`
- `daily_kpis.view.lkml`
- `category_performance.view.lkml`

## Expected Value

This case shows how a raw transactional dataset can be progressively transformed into assets that are easier to consume for BI, monitoring and future analytical extensions.