resource "google_cloud_run_service" "service" {
    name     = var.name
	location = var.location
    project  = var.project
    template {
        spec {
            containers {
                image = var.image
            }
        }
    }
    metadata {
        annotations = {
            "autoscaling.knative.dev/maxScale" = var.autoscaling,
            "run.googleapis.com/ingress"        = "all",
        }
    }
}