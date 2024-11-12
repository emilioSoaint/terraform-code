# Configuracion de terraform
terraform {
    # La configuracion de la parte de backend se encuentra en el archivo backend.tf
    # Si usamos esto, tenemos que tener permisos para trabajar sobre la nube
    # backend "gcs" {
    #     bucket = "gcp-terraform-state"
    #     prefix = "terraform/state"
    # }
    # Version de terraform
    # required_version = ">= 0.12"
    # Requerimientos del proveedor
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "6.9.0"
        }

    }
}

# Configuración del proveedor
provider "google" {
    project = "cdt-principal"
    region  = "us-central1"
}

# terraform apply -var="key=value" -var="key2=value2" -> para ejecutar terraform con variables
# terraform apply -var-file="variables.tfvar" 