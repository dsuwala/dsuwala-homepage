resource "google_project_service" "iamcredentials_googleapis_com" {
  project = var.project_number
  service = "iamcredentials.googleapis.com"
}
