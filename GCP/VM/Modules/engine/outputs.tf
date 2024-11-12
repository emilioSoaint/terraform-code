output "web_url" {
  value       = join("",["http://",google_compute_instance.my-vm.*.network_interface.0.access_config.0.nat_ip,":5000"] )
  sensitive   = true
  description = "The URL of the web server"
}