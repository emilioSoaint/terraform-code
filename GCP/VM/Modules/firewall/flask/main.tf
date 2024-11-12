resource "google_compute_firewall" "firewall-rule" {
  name    = "${var.name}-firewall-rule"
  network = var.network # VPC network

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_ranges = var.source_ranges

}

