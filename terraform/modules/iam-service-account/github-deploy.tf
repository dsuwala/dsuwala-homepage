resource "google_service_account" "github_deploy" {
  account_id  = var.github_deploy_service_account
  description = "Service account for CI/CD through github"
  project     = var.project_id
}
