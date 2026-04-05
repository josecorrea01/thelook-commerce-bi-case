view: category_performance {
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
    
  dimension: product_rank_in_category {
    type: number
    sql: ${TABLE}.product_rank_in_category ;;
  }

  dimension: category_order_item_count {
    type: number
    sql: ${TABLE}.category_order_item_count ;;
  }

  dimension: product_order_item_count {
    type: number
    sql: ${TABLE}.product_order_item_count ;;
  }

  measure: total_category_revenue {
    type: max
    sql: ${TABLE}.category_revenue ;;
    value_format_name: usd
  }

  measure: total_product_revenue {
    type: sum
    sql: ${TABLE}.product_revenue ;;
    value_format_name: usd
  }

  measure: avg_category_revenue_share {
    type: average
    sql: ${TABLE}.category_revenue_share ;;
    value_format_name: percent_2
  }
}