# Create a single Compute Engine instance

data "google_client_openid_userinfo" "me" {}

resource "google_compute_instance" "default" {
  count        = var.gcp_vm_count
  name         = format("${var.instance_prefix}-%02d", count.index+1)
  machine_type = "t2a-standard-1"
  zone         = var.zone
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = true
    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${replace(tls_private_key.gcp.public_key_openssh, "\n", "")} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
#   user-data      = data.template_file.cloud_config.rendered
    user-data      = data.cloudinit_config.cloud_config.rendered
#   user_data      = "${base64encode(file("${local.cloud_init_template_file}"))}"
#   user_data      = "${file("${local.cloud_init_template_file}")}"
    startup-script = local.os_images[var.gcp_os_image].startup_script
  }
  boot_disk {
    initialize_params {
       image = local.os_images[var.gcp_os_image].os_image
    }
  }

  network_interface {
    network    = google_compute_network.vnet.self_link
    subnetwork = google_compute_subnetwork.vnet.self_link

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
