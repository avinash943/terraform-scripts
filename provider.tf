provider "google" {
  credentials = file("C:/Users/sksus/Downloads/avian-chariot-450105-b7-da7e611e5b3c.json")
  project     = "avian-chariot-450105-b7"
  region      = var.region
}
