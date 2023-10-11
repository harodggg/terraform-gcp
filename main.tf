terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }

  }

}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone

}

resource "google_compute_network" "vpc_network" {
  name = "mynetwork"

}

resource "google_compute_instance" "vm_instance" {
  count        = var.machine_num
  name         = "my-instance-${count.index}"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}



data "google_compute_address" "my_address" {
  count = var.machine_num
  name  = "my-instance-${count.index}"
}

