resource "google_storage_bucket" "storage_bucket" {
  name          = var.name
  location      = var.location
  uniform_bucket_level_access = true # Esto permite modificar el nivel de acceso a la carpeta
}

#Probar esto - Permite declarar un archivo a utilizar
data "archive_file" "myapp" {
  type        = "zip"
  source_dir  = "flask"
  output_path = "flask.zip"
}

# Copia el objeto al bucket
resource "google_storage_bucket_object" "myapp" {
  name   = "flask.zip"
  bucket = google_storage_bucket.storage_bucket.name
  source = data.archive_file.myapp.output_path
}

