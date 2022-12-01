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

output "gcp_ssh_pubic_key" {
  value = tls_private_key.gcp.public_key_openssh
}

output "gcp_ssh_private_key" {
  value = tls_private_key.gcp.private_key_pem
  sensitive = true
}

resource "random_uuid" "random_id" { }
