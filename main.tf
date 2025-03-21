# 1. VPC Configuration
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

# 2. Subnet Configuration
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-1"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.0.0/24"
}

 resource "google_storage_bucket" "terraform-afrozbucket" {
  name          = "terraform-afrozbucket"
  location      = "US"
}
# 3. VM Instance Configuration
resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
      # Allocate a public IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Hello, World!" > /var/www/html/index.html
    EOT
}
# 4. Google Kubernetes Engine (GKE) Cluster Configuration
resource "google_container_cluster" "aks_cluster" {
  name     = "my-aks-cluster"

  initial_node_count = 1
  node_config {
    machine_type = "e2-medium"
  }

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name

}

# 5. Persistent Disk Configuration
resource "google_compute_disk" "disk" {
  name  = "my-disk"
  size  = 10  # Size in GB
  type  = "pd-standard"  # Standard persistent disk
}