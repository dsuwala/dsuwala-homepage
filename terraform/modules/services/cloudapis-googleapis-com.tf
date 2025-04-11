resource "google_project_service" "cloudapis_googleapis_com" {
  project = var.project_number
  service = "cloudapis.googleapis.com"
}
