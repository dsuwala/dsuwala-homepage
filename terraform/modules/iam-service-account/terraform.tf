resource "google_service_account" "terraform_runner" {
  account_id   = var.terraform_service_account
  description  = "Service Account for portfolio page Terraform"
  display_name = var.terraform_service_account
  project      = var.project_id
}

resource "google_project_iam_member" "cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "artifactregistry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "service_usage_admin" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "resource_manager_iam_admin" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "iam_service_account_viewer" {
  project = var.project_id
  role    = "roles/iam.serviceAccountViewer"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "logging_log_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "logging_log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_storage_bucket_iam_member" "terraform_runner_bucket_admin" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_storage_bucket_iam_member" "bucket_iam" {
  bucket = var.bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_storage_bucket_iam_member" "bucket_viewer" {
  bucket = var.bucket_name
  role   = "roles/storage.bucketViewer"
  member = "serviceAccount:${google_service_account.terraform_runner.email}"
}
