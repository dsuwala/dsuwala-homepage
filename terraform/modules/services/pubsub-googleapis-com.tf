resource "google_project_service" "pubsub_googleapis_com" {
  project = var.project_number
  service = "pubsub.googleapis.com"
}
