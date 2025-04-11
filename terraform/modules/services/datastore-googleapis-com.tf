resource "google_project_service" "datastore_googleapis_com" {
  project = var.project_number
  service = "datastore.googleapis.com"
}
