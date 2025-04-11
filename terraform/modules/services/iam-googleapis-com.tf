resource "google_project_service" "iam_googleapis_com" {
  project = var.project_number
  service = "iam.googleapis.com"
}
