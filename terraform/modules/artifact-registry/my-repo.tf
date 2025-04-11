resource "google_artifact_registry_repository" "my_repo" {
  format        = "DOCKER"
  location      = "europe-central2"
  mode          = "STANDARD_REPOSITORY"
  project       = var.project_id
  repository_id = "my-repo"
}
