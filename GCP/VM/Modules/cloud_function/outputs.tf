output "function_name" {
  value       = google_cloudfunctions2_function.function.name
  sensitive   = true
  description = "The name of the function"
}

output "location" {
  value       = google_cloudfunctions2_function.function.location
  sensitive   = true
  description = "The location of the function"
}

output "function_url" {
  value       = google_cloudfunctions2_function.function.service_config[0].uri
  sensitive   = true
  description = "The URL of the function"
}