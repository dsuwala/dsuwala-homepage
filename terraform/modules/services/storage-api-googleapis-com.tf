resource "google_project_service" "storage_api_googleapis_com" {
  project = var.project_number
  service = "storage-api.googleapis.com"
}
