variable ip_range {
  type        = string
  default     = "10.0.1.0/24"
  description = "The IP range of the subnet"
}

variable region {
  type        = string
  default     = "us-central1"
  description = "The region of the subnet"
}

variable subnet_name {
  type        = string
  default     = "my-test-subnetwork"
  description = "The name of the subnet"
}

variable vpc_name {
  type        = string
  default     = "my-test-vpc"
  description = "The name of the VPC"
}