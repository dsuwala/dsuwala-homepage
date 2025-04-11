resource "google_project_service" "servicemanagement_googleapis_com" {
  project = var.project_number
  service = "servicemanagement.googleapis.com"
}
