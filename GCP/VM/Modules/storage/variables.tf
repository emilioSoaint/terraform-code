variable "name" {
  type        = string
  default     = "my-test-bucket"
  description = "The name of the bucket"
}

variable "location" {
  type        = string
  default     = "US"
  description = "The location of the bucket"
}