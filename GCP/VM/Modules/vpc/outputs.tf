output "subnet_id" {
  value       = google_compute_subnetwork.vpc_subnet.id
  sensitive   = true
  description = "The ID of the subnet"
}

output "vpc_id" {
  value       = google_compute_network.vpc_newtwork.id
  sensitive   = true
  description = "The ID of the VPC"
}

