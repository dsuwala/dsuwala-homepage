resource "google_artifact_registry_repository" "general_repo" {
  cleanup_policy_dry_run = true
  description            = "Repository for non-standard files required during build"
  format                 = "GENERIC"
  location               = "europe"
  mode                   = "STANDARD_REPOSITORY"
  project                = var.project_id
  repository_id          = "general-repo"
}
