resource "google_project_service" "containerregistry_googleapis_com" {
  project = var.project_number
  service = "containerregistry.googleapis.com"
}
