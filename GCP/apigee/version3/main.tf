# Que necesito para crear un apigee
# 1. Organization
# 2. Environment
# 3. Environment Group
# 4. Enviroment Group Attachment
# 5. Instance
# 6. Instance Attachment

# 0. Api management - APIs & Services
resource "google_project_service" "apigee" {
  project = var.project_id
  service = "apigee.googleapis.com"
}

resource "google_project_service" "service_networking" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"
}

# 1. Organization
## 1.1 VCP
resource "google_compute_network" "apigee_network" {
    name = var.network
}

## 1.2 IP ranges
resource "google_compute_global_address" "apigee_ip_range" {
  name = var.ip_range_name
  project = var.project_id
  purpose = "VPC_PEERING"
  address_type = "INTERNAL"
  prefix_length = var.ip_range_prefix
  network = google_compute_network.apigee_network.id
}

## 1.3 Network connection
resource "google_service_networking_connection" "apigee_connection" {
  network = google_compute_network.apigee_network.id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.apigee_ip_range.name]
}

## 1.4 ORG
resource "google_apigee_organization" "org" {
  org_id = var.org_id
  project_id = var.project_id
  analytics_region = var.analytics_region
  authorized_network = google_service_networking_connection.apigee_connection.network
  depends_on = [google_compute_network.apigee_network, google_service_networking_connection.apigee_connection]
}

# 2. Environment
resource "google_apigee_environment" "env" {
    org_id = google_apigee_organization.org.id
    name = var.env_name
    description = var.env_description
    display_name = var.env_display_name
}

# 3. Environment Group
resource "google_apigee_envgroup" "envgroup" {
    org_id = google_apigee_organization.org.id
    name = var.envgroup_name
    hostnames = var.envgroup_hostnames # List of hostnames
}

# 4. Environment Group Attachment
resource "google_apigee_envgroup_attachment" "envgroup_attachment" {
    envgroup_id = google_apigee_envgroup.envgroup.id
    environment = google_apigee_environment.env.id
}

# 5. Instance
resource "google_apigee_instance" "instance" {
    org_id = google_apigee_organization.org.id
    name = var.instance_name
    location = var.instance_region
    depends_on = [google_apigee_environment.env]
}

# 6. Instance Attachment
resource "google_apigee_instance_attachment" "instance_attachment" {
    instance_id = google_apigee_instance.instance.id
    environment = google_apigee_environment.env.name
    depends_on = [google_apigee_instance.instance]
}