resource "google_project_service" "oslogin_googleapis_com" {
  project = var.project_number
  service = "oslogin.googleapis.com"
}
