resource "google_project_service" "bigquery_googleapis_com" {
  project = var.project_number
  service = "bigquery.googleapis.com"
}
