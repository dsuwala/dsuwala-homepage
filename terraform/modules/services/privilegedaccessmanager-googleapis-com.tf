resource "google_project_service" "privilegedaccessmanager_googleapis_com" {
  project = var.project_number
  service = "privilegedaccessmanager.googleapis.com"
}
