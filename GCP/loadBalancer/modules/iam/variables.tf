variable "location" {
  type        = string
  description = "The location of the Cloud Run service."
}

variable "project" {
  type        = string
  description = "The project where the Cloud Run service is located."
}

variable "service" {
  type        = string
  description = "The name of the Cloud Run service."
}
