# ssh keys
resource "tls_private_key" "gce" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "gce-ssh-privkey" {
    content = tls_private_key.gce.private_key_pem
    filename = "${path.module}/gce-id_rsa"
    file_permission = "0600"
}

resource "local_file" "gce-ssh-pubkey" {
    content  = tls_private_key.gce.public_key_openssh
    filename = "${path.module}/gce-id_rsa.pub"
    file_permission = "0644"
}

output "gce_ssh_pubic_key" {
  value = tls_private_key.gce.public_key_openssh
}

output "gce_ssh_private_key" {
  value = tls_private_key.gce.private_key_pem
  sensitive = true
}

resource "random_uuid" "random_id" { }
