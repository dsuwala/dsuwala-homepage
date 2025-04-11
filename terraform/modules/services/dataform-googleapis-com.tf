resource "google_project_service" "dataform_googleapis_com" {
  project = var.project_number
  service = "dataform.googleapis.com"
}
