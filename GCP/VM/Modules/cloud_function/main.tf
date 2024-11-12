resource "google_cloudfunctions2_function" "function" {
    name        = var.name
    location    = var.region
    description = "A function that returns a greeting"

    build_config {
        runtime = var.runtime
        entry_point = var.entry_point
        source {
            storage_source {
                bucket = var.bucket_name
                object = var.object_name
            }
        }
    }

    service_config {
        max_instances = var.max_instances
        available_memory = var.memory
        timeout = var.timeout
    }
}