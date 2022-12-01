####################
# Google Variables #
####################

## Google Project name
## -------------------

variable "project_id" {
  description = "Google Project ID"
}

variable "location" {
  description = "Google Location"
  default = "US"
}

variable "region" {
  description = "Google Region"
  default = "us-central1"
}
variable "zone" {
  description = "Google Region"
  default = "us-central1-a"
}

variable "gcp_vm_count" {
  description = "GCE Virtual Machine Count"
  default     = 1
}

variable "cloud_init_template_file" {
  default     = null
  description = "Optional path for a cloud-init file"
  type        = string
}
variable "startup_script_template_file" {
  default     = null
  description = "Optional path for a startup script file"
  type        = string
}
variable "instance_prefix" {
  description = "Name prefix for vm instances"
  default     = "ampere-taut2a"
}
variable "virtual_network_name" {
  default     = "terraform-ampere-taut2a"
  description = "virtual_network_name"
  type        = string
}


variable "gcp_vcn_cidr_block" {
  default     = "10.2.0.0/16"
  description = "CIDR Address range for GCE Networks"
  type        = string
}

variable "gcp_vcn_cidr_subnet" {
  default     = "10.2.1.0/24"
  description = "CIDR Address range for GCE Networks"
  type        = string
}

variable "gcp_os_image" {
#  default     = "ubuntu2204"
#  default     = "rockylinux9"
  default     = "debian11"
  description = "Default OS Image From the Local Vars"
}
