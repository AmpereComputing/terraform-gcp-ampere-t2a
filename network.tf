#GCE Network definition
resource "google_compute_network" "vnet" {
  name                = var.virtual_network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

# GCE Subnet Definition
resource "google_compute_subnetwork" "subnet" {
  name                 = "${var.rg_prefix}-subnet"
  ip_cidr_range        = [var.address_space]
  region               = var.location
  network              = google_compute_network.vnet.id
}
