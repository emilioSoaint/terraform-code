# Original: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger#example-usage---cloudbuild-trigger-service-account
resource "google_cloudbuild_trigger" "cloud_build_trigger" {
    name = "cloud-build-trigger"
    description = "Cloud Build trigger"
    project = var.project_id
    location = var.region

    # Archivo a utilizar para el cloudbuild
    filename = "cloudbuild.yaml"

    # Variables de sustituación en el pipeline
    substitutions = {
        "_REGISTRY"   = var.registry_name
        "_MODULE"     = var.module_name
        "_PROJECT"    = var.project_id
        "_REGION"     = var.region
        "_REPOSITORY_NAME" = var.repository_name
        "_APP1" = var.app1
    }

    github {
        owner = "emilioSoaint"
        name = "bivi-java-2"
        push {
            branch = "^main$"
        }
    }
}