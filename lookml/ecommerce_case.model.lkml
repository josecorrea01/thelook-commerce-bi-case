include: "/lookml/daily_kpis.view.lkml"
include: "/lookml/category_performance.view.lkml"

explore: daily_kpis {
  label: "Daily KPIs"
}

explore: category_performance {
  label: "Category Performance"
}