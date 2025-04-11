resource "google_project_service" "cloud_build" {
  project = var.project_number
  service = "cloudbuild.googleapis.com"
}
