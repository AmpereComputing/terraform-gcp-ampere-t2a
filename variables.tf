####################
# Google Variables #
####################

## Google Project name
## -------------------

variable "google_gce_service_account_credentials_file" {
  description = "Google GCE Service Account Credentials File"
}


variable "google_project_id" {
  description = "Google Project ID"
}

variable "google_location" {
  description = "Google Location"
  default = "US"
}

variable "google_region" {
  description = "Google Region"
  default = "us-central1"
}

variable "google_storage_class" {
  description = "Google Storage Class"
  default = "standard"
}
