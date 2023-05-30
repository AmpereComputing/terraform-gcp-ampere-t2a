# Cloud Init Metadata


locals {
  # return var.cloud_init_template_path if it's not null
  # otherwise return "${path.module}/templates/cloud-init.yaml.tpl"
  cloud_init_template_file = coalesce(var.cloud_init_template_file, "${path.module}/templates/cloud-init.yaml.tpl")
  startup_script_template_file = coalesce(var.startup_script_template_file, "${path.module}/templates/startup-script.sh.tpl")
}

data "template_file" "cloud_config" {
# template = file("${path.module}/templates/cloud-init.yaml.tpl")
  template = file("${local.cloud_init_template_file}")
}

# Output rendered cloud-init metadata
output "cloud_init" {
  value = data.template_file.cloud_config.rendered
  sensitive = false
}

data "template_file" "startup_script" {
# template = file("${path.module}/templates/startup-script.sh.tpl")
  template = file("${local.startup_script_template_file}")
}

# Output rendered startup script
output "startup_script" {
  value = data.template_file.startup_script.rendered
  sensitive = false
}

data "cloudinit_config" "cloud_config" {
  gzip = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content = data.template_file.cloud_config.rendered
    filename = "cloud.cfg"
  }
}

#resource "google_compute_project_metadata_item" "ssh-keys" {
#  key   = "ssh-keys"
#  value =  tls_private_key.gcp.public_key_openssh
#  value = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${replace(tls_private_key.gcp.public_key_openssh, "\n", "")} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
#}

resource "google_os_login_ssh_public_key" "cache" {
  user = data.google_client_openid_userinfo.me.email
#  key =  tls_private_key.gcp.public_key_openssh
  key = "${replace(tls_private_key.gcp.public_key_openssh, "\n", "")} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
  project = var.project_id
}
