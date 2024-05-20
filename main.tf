
# Cloud-Init file
locals {
  # return var.cloud_init_template_path if it's not null
  # otherwise return "${path.module}/templates/cloud-init.yaml.tpl"
  cloud_init_template_file = coalesce(var.cloud_init_template_file, "${path.module}/templates/cloud-init.yaml.tpl")
  startup_script_template_file = coalesce(var.startup_script_template_file, "${path.module}/templates/startup-script.sh.tpl")
}

# ssh keys
resource "tls_private_key" "gcp" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "gcp-ssh-privkey" {
    content = tls_private_key.gcp.private_key_pem
    filename = "${path.cwd}/gcp-id_rsa"
    file_permission = "0600"
}

resource "local_file" "gcp-ssh-pubkey" {
    content  = tls_private_key.gcp.public_key_openssh
    filename = "${path.cwd}/gcp-id_rsa.pub"
    file_permission = "0644"
}

# Output GCE SSH public key
output "gcp_ssh_pubic_key" {
  value = tls_private_key.gcp.public_key_openssh
}

# Output GCE SSH private key
output "gcp_ssh_private_key" {
  value = tls_private_key.gcp.private_key_pem
  sensitive = true
}

resource "random_uuid" "random_id" { }

# Output a randomly generated uuid
output "random_uuid" {
  value = random_uuid.random_id.result 
  sensitive = false
}   

resource "google_os_login_ssh_public_key" "cache" {
  user = data.google_client_openid_userinfo.me.email
#  key =  tls_private_key.gcp.public_key_openssh
  key = "${replace(tls_private_key.gcp.public_key_openssh, "\n", "")} ${split("@", data.google_client_openid_userinfo.me.email)[0]}"
  project = var.project_id
}

