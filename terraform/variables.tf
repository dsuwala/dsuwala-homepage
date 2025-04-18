variable "project_id" {
  description = "The GCP project ID"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "antirecommender_service_account" {
  description = "Service account name for the antirecommender Cloud Run service"
  type        = string
}

variable "homepage_service_account" {
  description = "Service account name for the homepage Cloud Run service"
  type        = string
}

variable "project_number" {
  description = "The GCP project number"
  type        = string
  sensitive   = true
}

variable "github_deploy_service_account" {
  description = "Service account name for the github deploy service"
  type        = string
}

variable "terraform_service_account" {
  description = "Service account name for the terraform service"
  type        = string
}

variable "bucket_name" {
  description = "The GCP bucket name"
  type        = string
}