resource "google_project_service" "cloud_resource_manager" {
  project = var.project_number
  service = "cloudresourcemanager.googleapis.com"
}
