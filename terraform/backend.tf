terraform {
  backend "gcs" {
    bucket = "portfolio-projects-storage"
    prefix = "terraform/state"
  }
} 