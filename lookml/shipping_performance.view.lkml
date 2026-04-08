view: shipping_performance {
  dimension_group: order_date {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.order_date ;;
  }

  dimension: shipped_orders {
    type: number
    sql: ${TABLE}.shipped_orders ;;
  }

  dimension: min_shipped_to_delivered_days {
    type: number
    sql: ${TABLE}.min_shipped_to_delivered_days ;;
  }

  dimension: max_shipped_to_delivered_days {
    type: number
    sql: ${TABLE}.max_shipped_to_delivered_days ;;
  }

  measure: avg_shipping_days {
    type: average
    sql: ${TABLE}.avg_shipped_to_delivered_days ;;
  }

  measure: max_rolling_7d_avg_shipping_days {
    type: max
    sql: ${TABLE}.rolling_7d_avg_shipping_days ;;
  }

  measure: avg_shipping_days_vs_previous_day {
    type: average
    sql: ${TABLE}.shipping_days_vs_previous_day ;;
  }
}
