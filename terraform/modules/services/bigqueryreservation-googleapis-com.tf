resource "google_project_service" "bigqueryreservation_googleapis_com" {
  project = var.project_number
  service = "bigqueryreservation.googleapis.com"
}
