resource "google_project_service" "logging_googleapis_com" {
  project = var.project_number
  service = "logging.googleapis.com"
}
