resource "google_project_service" "bigquerymigration_googleapis_com" {
  project = var.project_number
  service = "bigquerymigration.googleapis.com"
}
