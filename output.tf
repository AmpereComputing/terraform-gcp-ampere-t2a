# NEED TO CHANGE TO PRIVATE IP - WIP

# Output GCE Ampere Instance Private IP(s)
output "ampere_t2a_private_ips" {
  value = google_compute_instance.default.*.network_interface.0.network_ip
  sensitive = false
}

# Output GCE Ampere Instance Public IP(s)
output "ampere_t2a_public_ips" {
  value = google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip
  sensitive = false
}

# Output email address
output "my-email" {
  value = data.google_client_openid_userinfo.me.email
}

# Output rendered instance Metadata
output "ampere_t2a_metadata" {
  value = google_compute_instance.default.*.metadata
  sensitive = false
}
