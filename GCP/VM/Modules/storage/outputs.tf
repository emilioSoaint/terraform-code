output "bucket_name" {
  value       = google_storage_bucket.storage_bucket.name
  sensitive   = true
  description = "The name of the bucket"
}

output "object_name" {
  value       = google_storage_bucket_object.myapp.name
  sensitive   = true
  description = "The name of the object"
}