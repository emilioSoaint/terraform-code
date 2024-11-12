variable "name" {
  type        = string
  default     = "my-function"
  description = "The name of the function"
}

variable "runtime" {
  type        = string
  default     = "python37"
  description = "The runtime of the function"
}

variable "memory" {
  type        = number
  default     = 128
  description = "The memory of the function"
}

variable "bucket_name" {
  type        = string
  default     = "my-bucket"
  description = "The name of the bucket"
}

variable "object_name" {
  type        = string
  default     = "my-object"
  description = "The name of the object"
}

variable "timeout" {
  type        = number
  default     = 60
  description = "The timeout of the function"
}

variable "entry_point" {
  type        = string
  default     = "main"
  description = "The entry point of the function"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The region of the function"
}

variable "max_instances" {
  type        = number
  default     = 10
  description = "The max instances of the function"
}

