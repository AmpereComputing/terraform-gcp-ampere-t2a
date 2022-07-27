# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  count        = var.gce_vm_count
  name         = "ampere-tao-t2a"
  machine_type = "tao-t2a"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # Install Flask
  metadata_startup_script = "${base64encode(data.template_file.cloud_config.rendered)}"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
