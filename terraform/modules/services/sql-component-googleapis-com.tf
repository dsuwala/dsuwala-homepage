resource "google_project_service" "sql_component_googleapis_com" {
  project = var.project_number
  service = "sql-component.googleapis.com"
}
