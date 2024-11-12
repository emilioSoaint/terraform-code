# For Cloud Run

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_region_network_endpoint_group" "cloud_run_group" {
  name                  = "${var.name}-endpoint"
  region                = var.region
  provider              = var.provider
  network_endpoint_type = var.network_endpoint_type
  cloud_run {
    service = google_cloud_run_service.service.name
  }
}

## Load Balancer

module "lb-http" {
    source = "terraform-google-modules/lb-http/google//modules/serverless_negs"
    version = "~> 12.0"

    name = "${var.name}-http"
    project = var.project

    ssl = var.ssl
    managed_ssl_certificate_domains = var.managed_ssl_certificate_domains
    http_redirect = var.ssl
    labels = var.labels

    backend = {
        default = {
            description = "Default backend"
            groups = [
                {
                    group = google_compute_region_network_endpoint_group.cloud_run_group.id
                }
            ]
            enable_cdn = var.enable_cdn
            iap_config = {
                enable = var.enable_iap
            }
            log_config = {
                enable = var.enable_logging
            }
        }
        
    }
}