resource "google_project_service" "bigqueryconnection_googleapis_com" {
  project = var.project_number
  service = "bigqueryconnection.googleapis.com"
}
