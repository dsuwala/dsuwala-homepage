resource "google_project_service" "bigquerystorage_googleapis_com" {
  project = var.project_number
  service = "bigquerystorage.googleapis.com"
}
