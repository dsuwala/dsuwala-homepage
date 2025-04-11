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

resource "google_project_iam_member" "storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "storage_object_user" {
  project = var.project_id
  role    = "roles/storage.objectUser"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "service_usage_admin" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "service_management_admin" {
  project = var.project_id
  role    = "roles/servicemanagement.quotaAdmin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}

resource "google_project_iam_member" "resource_manager_iam_admin" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${google_service_account.terraform_runner.email}"
}





