resource "google_project_service" "storage_component_googleapis_com" {
  project = var.project_number
  service = "storage-component.googleapis.com"
}
