resource "google_project_service" "serviceusage_googleapis_com" {
  project = var.project_number
  service = "serviceusage.googleapis.com"
}
