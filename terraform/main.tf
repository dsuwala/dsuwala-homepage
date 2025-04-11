
provider "google" {
  project = var.project_id
}


module "modules-iam-service-account" {
  source                          = "./modules/iam-service-account"
  project_id                      = var.project_id
  antirecommender_service_account = var.antirecommender_service_account
  homepage_service_account        = var.homepage_service_account
  github_deploy_service_account   = var.github_deploy_service_account
}


module "modules-services" {
  source         = "./modules/services"
  project_id     = var.project_id
  project_number = var.project_number
}


module "modules-cloud-run" {
  source                          = "./modules/cloud-run"
  project_id                      = var.project_id
  region                          = var.region
  antirecommender_service_account = var.antirecommender_service_account
  homepage_service_account        = var.homepage_service_account
  project_number                  = var.project_number
}


module "modules-artifact-registry" {
  source     = "./modules/artifact-registry"
  project_id = var.project_id
}


module "modules-storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  bucket_name = var.bucket_name
}
