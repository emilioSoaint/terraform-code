data "google_compute_network" "vpc" {
  name = var.network
}

module "apigee" {
  source     = "./apigee"
  project_id = var.project_id

  envgroups = {
    dev = ["dev.example.com"]
  }
  environments = {
    apis-dev = {
      display_name = "APIs prod"
      description  = "APIs Prod"
      envgroups    = ["dev"]
    }
  }
  instances = {
    us-central1 = {
      environments                  = ["apis-dev"]
      # runtime_ip_cidr_range         = "10.32.0.0/22"
      # troubleshooting_ip_cidr_range = "10.64.0.0/28"
    }
  }
}