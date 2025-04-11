resource "google_service_account" "homepage_runner" {
  account_id   = var.homepage_service_account
  description  = "runner service account for homepage"
  display_name = var.homepage_service_account
  project      = var.project_id
}

resource "google_project_iam_member" "homepage_runner_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.homepage_runner.email}"
}

resource "google_project_iam_member" "homepage_runner_run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.homepage_runner.email}"
}

resource "google_project_iam_member" "homepage_log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.homepage_runner.email}"
}

resource "google_project_iam_member" "homepage_log_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = "serviceAccount:${google_service_account.homepage_runner.email}"
}
