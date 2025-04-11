resource "google_service_account" "antirecommender_run" {
  account_id   = var.antirecommender_service_account
  description  = "Run account for antirecommender with GCS access"
  display_name = var.antirecommender_service_account
  project      = var.project_id
}
