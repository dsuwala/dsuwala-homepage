resource "google_project_service" "bigquerydatapolicy_googleapis_com" {
  project = var.project_number
  service = "bigquerydatapolicy.googleapis.com"
}
