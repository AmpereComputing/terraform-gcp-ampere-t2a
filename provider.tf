terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
 #    version = "3.5.0"
    }
  }
}



# Google Provider

# Auth Info
provider "google" {
# credentials = file(var.google_gce_service_account_credentials_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
