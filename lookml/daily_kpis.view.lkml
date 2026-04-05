view: daily_kpis {
  dimension_group: order_date {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.order_date ;;
  }

  dimension: daily_order_count {
    type: number
    sql: ${TABLE}.daily_order_count ;;
  }

  dimension: daily_order_item_count {
    type: number
    sql: ${TABLE}.daily_order_item_count ;;
  }

  measure: total_daily_revenue {
    type: sum
    sql: ${TABLE}.daily_revenue ;;
    value_format_name: usd
  }

  measure: avg_item_price {
    type: average
    sql: ${TABLE}.avg_item_price ;;
    value_format_name: usd
  }

  measure: max_rolling_7d_revenue {
    type: max
    sql: ${TABLE}.rolling_7d_revenue ;;
    value_format_name: usd
  }
}