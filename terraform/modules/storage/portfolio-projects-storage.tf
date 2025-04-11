resource "google_storage_bucket" "portfolio_projects_storage" {
  force_destroy               = false
  location                    = "EU"
  name                        = var.bucket_name
  project                     = var.project_id
  public_access_prevention    = "enforced"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
