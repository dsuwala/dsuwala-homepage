resource "google_project_service" "artifactregistry_googleapis_com" {
  project = var.project_number
  service = "artifactregistry.googleapis.com"
}
