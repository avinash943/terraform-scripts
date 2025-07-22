
# 1. VPC Configuration
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks  = false  # Disable auto-creation of subnets
}

# 2. Subnet Configuration
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-1"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

# 3. Google Cloud Storage Bucket
resource "google_storage_bucket" "my-first-bucket-v1" {
  name     = "my-first-bucket-v1"
  location = "US"
}
