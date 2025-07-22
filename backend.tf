terraform {
  backend "gcs" {
    bucket = " my-first-bucket-v1"  # GCS bucket name
    prefix = "terraform/state"              # Path within the bucket (e.g., a folder structure)
  }
}
