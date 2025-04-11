resource "google_service_account" "antirecommender_run" {
  account_id   = var.antirecommender_service_account
  description  = "Run account for antirecommender with GCS access"
  display_name = var.antirecommender_service_account
  project      = var.project_id
}

resource "google_project_iam_member" "antirecommender_run_storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.antirecommender_run.email}"
}

resource "google_project_iam_member" "antirecommender_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.antirecommender_run.email}"
}

