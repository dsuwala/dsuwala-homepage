resource "google_project_service" "storage_googleapis_com" {
  project = var.project_number
  service = "storage.googleapis.com"
}
