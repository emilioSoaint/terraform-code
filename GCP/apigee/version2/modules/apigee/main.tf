resource "google_apigee_organization" "org" {
    org_id = var.org_id
    project_id = var.project_id
    analytics_region = var.analytics_region
}

resource "google_apigee_environment" "env" {
    ord_id = google_apigee_organization.org.id
    name = var.env_name
    display_name = var.env_display_name
}

resource "google_apigee_instance" "instance" {
    org_id = google_apigee_organization.org.id
    name = var.instance_name
    location = var.instance_region
    depends_on = [google_apigee_environment.env]
}

resource "google_apigee_instance_attachment" "instance_attachment" {
    instance_id = google_apigee_instance.instance.id
    Environment = google_apigee_environment.env.name
    depends_on = [google_apigee_instance.instance]
}