#GCE Network definition
resource "google_compute_network" "vnet" {
  name                = var.virtual_network_name
  auto_create_subnetworks = false
# auto_create_subnetworks = true
  mtu                     = 1460
}

# GCE Subnet Definition
resource "google_compute_subnetwork" "vnet" {
  name                 = "${var.virtual_network_name}-subnet"
  ip_cidr_range        = var.gcp_vcn_cidr_subnet
  region               = var.region
  network              = google_compute_network.vnet.self_link
}

resource "google_compute_address" "static_ip" {
  name = "debian-vm"
}
