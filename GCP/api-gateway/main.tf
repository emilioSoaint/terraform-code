# Api gateway
resource "google_api_gateway_api" "api_gateway" {
    api_id = var.api_gateway_name
    project = var.project
    display_name = var.api_gateway_name_display
    provider = google-beta
    
}

# Api config
resource "google_api_gateway_api_config" "api_config" {
  api = google_api_gateway_api.api_gateway.api_id
  api_config_id = var.api_config_name
  provider = google-beta
  display_name = var.api_config_name_display
  
  # Documentacion de OpenApi
  openapi_documents {
    document {
        # Path del archivo una vez se suba a la api gateway
        path = var.openapi_path
        # Archivo a cargar
        contents = filebase64(var.openapi_path_file)
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

# API
resource "google_api_gateway_gateway" "api" {
  project = var.project
  display_name = var.api_name_display
  provider = google-beta

  # Api gateway
  gateway_id = var.api_name

  # Api config
  api_config = google_api_gateway_api_config.api_config.id
}