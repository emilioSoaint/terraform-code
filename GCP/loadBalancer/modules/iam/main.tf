resource "google_cloud_run_service_iam_member" "service" {
    location = var.location
    project  = var.project
    service  = var.service

    role    = "roles/run.invoker"
    member  = "allUsers"
}