variable "name" {
  type        = string
  description = "The name of the Cloud Run service."
}

variable "location" {
  type        = string
  description = "The location of the Cloud Run service."
}

variable "project" {
  type        = string
  description = "The project where the Cloud Run service is located."
}

variable "image" {
  type        = string
  description = "The image to run for the Cloud Run service."
}

variable "autoscaling" {
  type        = string
  description = "The maximum number of instances that Cloud Run can autoscale to."
}