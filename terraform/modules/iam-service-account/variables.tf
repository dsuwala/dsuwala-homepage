variable "project_id" {
  description = "The GCP project ID"
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

variable "github_deploy_service_account" {
  description = "Service account name for the github deploy service"
  type        = string
} 


