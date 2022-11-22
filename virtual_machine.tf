# Create a single Compute Engine instance

data "google_client_openid_userinfo" "me" {}

resource "google_compute_instance" "default" {
  count        = var.gce_vm_count
  name         = format("${var.instance_prefix}-%02d", count.index+1)
  machine_type = "t2a-standard-1"
  zone         = var.zone
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = true
#   ssh-keys = "root:${tls_private_key.gce.public_key_openssh}"
#    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.gce.public_key_openssh}"
#    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.gce.public_key_openssh} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${replace(tls_private_key.gce.public_key_openssh, "\n", "")} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
#   ssh-keys       = "ppouliot_amperecomputing_com:${tls_private_key.gce.public_key_openssh}"
#   ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.gce.public_key_openssh}"
#   user-data      = "${base64encode(data.template_file.cloud_config.rendered)}"
### Works for Ubuntu Metadata
    user-data      = data.template_file.cloud_config.rendered
#   user-data      = data.cloudinit_config.cloud_config.rendered
#   startup-script = data.template_file.startup_script.rendered
    startup-script = local.os_images[var.gcp_os_image].startup_script
  }
  boot_disk {
    initialize_params {
       image = local.os_images[var.gcp_os_image].os_image
#       image = "debian-11-arm64"
#      image = "cos-arm64-101-lts"  # Can't Find
#       image = "rocky-linux-9-optimized-gcp-arm64"
#      image = "rocky-linux-9-arm64"
#      image = "rocky-linux-8-optimized-gcp-arm64"
#      image = "ubuntu-2204-lts-arm64"
    }
  }

  network_interface {
#    network = "default"
    network    = google_compute_network.vnet.self_link
    subnetwork = google_compute_subnetwork.vnet.self_link

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
