resource "google_project_service" "run_googleapis_com" {
  project = var.project_number
  service = "run.googleapis.com"
}
