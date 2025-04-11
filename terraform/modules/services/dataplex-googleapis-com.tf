resource "google_project_service" "dataplex_googleapis_com" {
  project = var.project_number
  service = "dataplex.googleapis.com"
}
