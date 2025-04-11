resource "google_cloud_run_v2_service" "homepage" {
  client         = "gcloud"
  client_version = "514.0.0"
  ingress        = "INGRESS_TRAFFIC_ALL"
  launch_stage   = "GA"
  location       = var.region
  name           = "homepage"
  project        = var.project_id

  template {
    containers {
      env {
        name  = "PREDICTION_ENGINE_URL"
        value = "https://antrecommender-${var.project_number}.${var.region}.run.app"
      }

      image = "${var.region}-docker.pkg.dev/${var.project_id}/my-repo/homepage:latest"

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

    service_account = "${var.homepage_service_account}@${var.project_id}.iam.gserviceaccount.com"
    timeout         = "300s"
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}
