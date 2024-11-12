resource "google_cloud_run_service_iam_member" "invoker" {
    location = var.location
    service = var.service
    role = "roles/run.invoker"
    member = "allUsers"
}

