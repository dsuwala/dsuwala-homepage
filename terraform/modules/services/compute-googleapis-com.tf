resource "google_project_service" "compute_googleapis_com" {
  project = var.project_number
  service = "compute.googleapis.com"
}
