variable "name" {
  type = string
  default = "allow-ssh"
}

variable "network" {
  type = string
}

variable "source_ranges" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "direction" {
  type = string
  default = "INGRESS"
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "ports" {
  type = list(string)
  default = ["22"]
}

variable "priority" {
  type = number
  default = 1000
}