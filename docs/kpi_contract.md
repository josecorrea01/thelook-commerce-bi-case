# KPI Contract

## 1. Daily Revenue
**Definition:** Total `sale_price` per calendar day based on `order_date`.

## 2. Daily Order Count
**Definition:** Distinct count of `order_id` per day.

## 3. Daily Order Item Count
**Definition:** Number of order item rows per day.

## 4. Average Item Price
**Definition:** Average `sale_price` per day.

## 5. Rolling 7-Day Revenue
**Definition:** Sum of daily revenue over the current day plus previous 6 days.

## 6. Revenue vs Previous Day
**Definition:** Daily revenue minus previous day's revenue.

## 7. Category Revenue
**Definition:** Total revenue attributed to a category.

## 8. Category Revenue Share
**Definition:** Category revenue divided by total revenue across all categories.

## 9. Product Rank Within Category
**Definition:** Rank of each product inside its category based on revenue, using descending order.

## 10. Shipped Orders
**Definition:** Distinct count of `order_id` with both `shipped_at` and `delivered_at` available for the day.

## 11. Average Shipped-to-Delivered Days
**Definition:** Average number of days between `shipped_at` and `delivered_at`.

## 12. Rolling 7-Day Average Shipping Days
**Definition:** Rolling 7-day average of `avg_shipped_to_delivered_days`.

## 13. Shipping Days vs Previous Day
**Definition:** Difference between the current day's average shipping time and the previous day's average shipping time.