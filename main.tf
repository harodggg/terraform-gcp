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
  project     = var.project
  region      = var.region
  zone        = var.zone
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
      image = var.machine_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link

    access_config {
    }
  }

  metadata_startup_script = var.startup_script

}

/*
A key set in project metadata is propagated to every instance in the project.
This resource configuration is prone to causing frequent diffs as Google adds SSH Keys when the SSH Button is pressed in the console.
It is better to use OS Login instead.
*/
resource "google_compute_project_metadata" "my_ssh_key" {
  metadata = {
    ssh-keys = <<EOF
    ${var.public_keys}
    EOF
  }
}

resource "google_compute_firewall" "firewall" {
  name     = "my-firewall"
  priority = 65534
  network  = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.open_ports
  }

  source_ranges = ["0.0.0.0/0"]

}



data "google_compute_instance" "vm_instances_data" {
  count = var.machine_num
  name  = google_compute_instance.vm_instance[count.index].name
}

