include: "/lookml/daily_kpis.view.lkml"
include: "/lookml/category_performance.view.lkml"
include: "/lookml/shipping_performance.view.lkml"

explore: daily_kpis {
  label: "Daily KPIs"
}

explore: category_performance {
  label: "Category Performance"
}

explore: shipping_performance {
  label: "Shipping Performance"
}