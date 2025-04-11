locals {
  service_account_email = "${var.antirecommender_service_account}@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_cloud_run_v2_service" "antrecommender" {
  client         = "gcloud"
  client_version = "515.0.0"
  ingress        = "INGRESS_TRAFFIC_ALL"
  launch_stage   = "GA"
  location       = var.region
  name           = "antrecommender"
  project        = var.project_id

  template {
    containers {
      env {
        name  = "GCS_BUCKET_NAME"
        value = "portfolio-projects-storage"
      }

      image = "${var.region}-docker.pkg.dev/${var.project_id}/my-repo/antirecommender:latest"

      ports {
        container_port = 8080
        name           = "http1"
      }

      resources {
        cpu_idle = true

        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }

        startup_cpu_boost = true
      }

      startup_probe {
        failure_threshold     = 1
        initial_delay_seconds = 0
        period_seconds        = 240

        tcp_socket {
          port = 8080
        }

        timeout_seconds = 240
      }
    }

    max_instance_request_concurrency = 80

    scaling {
      max_instance_count = 100
    }

    service_account = local.service_account_email
    timeout         = "300s"
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}
