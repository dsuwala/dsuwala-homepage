resource "google_project_service" "monitoring_googleapis_com" {
  project = var.project_number
  service = "monitoring.googleapis.com"
}
