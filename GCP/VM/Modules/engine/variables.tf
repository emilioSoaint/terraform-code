variable vm_name {
  type        = string
  default     = "my-vm"
  description = "The name of the VM"
}

variable machine_type {
  type        = string
  default     = "e2-standard-2"
  description = "The machine type of the VM"
}

variable zone {
  type        = string
  default     = "us-central1-a"
  description = "The zone of the VM"
}

variable image {
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
  description = "The image of the VM"
}

variable network {
  type        = string
  default     = "default"
  description = "The network of the VM"
}   