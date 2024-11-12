terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}

module "vpc" {
  source = "./Modules/vpc"

  ip_range = "10.0.1.0/24"
  region   = "us-central1"

  vpc_name = "my-test-vpc"

  subnet_name = "my-test-subnetwork"
}

module "engine" {
  source = "./Modules/engine"

  vm_name = "my-vm"
  machine_type = "e2-standard-2"
  zone = "us-central1-a"
  image = "ubuntu-os-cloud/ubuntu-2004-lts"
  network = module.vpc.subnet_id
}

module "firewall" {
  source = "./Modules/firewall"

  name = "allow-ssh"
  network = module.vpc.vpc_id

  source_ranges = ["0.0.0.0/0"]

  direction = "INGRESS"
  protocol = "tcp"
  ports = ["22"]
}

module "firewall-flask" {
  source = "./Modules/firewall"

  name = "allow-flask"
  network = module.vpc.vpc_id

  source_ranges = ["0.0.0.0/0"]

  protocol = "tcp"
  ports = ["5000"]
}