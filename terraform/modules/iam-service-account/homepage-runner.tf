resource "google_service_account" "homepage_runner" {
  account_id   = var.homepage_service_account
  description  = "runner service account for homepage"
  display_name = var.homepage_service_account
  project      = var.project_id
}
