variable "project_id" {
  description = "Project ID"
}

variable "org_id" {
  description = "Organization ID"
}

variable "analytics_region" {
  description = "Analytics Region"
}

variable "network" {
  description = "Network name"
}

variable "ip_range_name" {
  description = "IP range name"
}

variable "ip_range_prefix" {
  description = "IP range prefix"
}

variable "env_name" {
  description = "Environment name"
}

variable "env_description" {
  description = "Environment description"
}

variable "env_display_name" {
  description = "Environment display name"
}

variable "envgroup_name" {
  description = "Environment group name"
}

variable "envgroup_hostnames" {
  description = "Environment group hostnames"
  type = list(string)
}

variable "instance_name" {
  description = "Instance name"
}

variable "instance_region" {
  description = "Instance region"
}   