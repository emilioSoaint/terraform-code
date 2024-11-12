resource "google_compute_network" "vpc_newtwork" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460 # Size supported for packege in network
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_range
  region        = var.region
  network       = google_compute_network.vpc_newtwork.id
}