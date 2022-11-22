# GCE Firewall Settings
# SSH
resource "google_compute_firewall" "ssh" {
  name          = "allow-ssh"
  network       = google_compute_network.vnet.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}

