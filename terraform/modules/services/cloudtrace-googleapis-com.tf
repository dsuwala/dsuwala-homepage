resource "google_project_service" "cloudtrace_googleapis_com" {
  project = var.project_number
  service = "cloudtrace.googleapis.com"
}
