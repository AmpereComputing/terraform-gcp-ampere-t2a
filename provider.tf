terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}



# Google Provider

# Auth Info
provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
