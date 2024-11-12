resource "google_compute_firewall" "firewall-rule" {
  name    = "${var.name}-firewall-rule"
  network = var.network # VPC network

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  # Dirección de la conexión
  direction = var.direction

  priority = var.priority

  source_ranges = var.source_ranges

  target_tags = ["firewall-rule"]
}

