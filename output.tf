# NEED TO CHANGE TO PRIVATE IP - WIP
output "ampere_taut2a_private_ips" {
  value = google_compute_instance.default.*.network_interface.0.network_ip
  sensitive = false
}

output "ampere_taut2a_public_ips" {
  value = google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip
  sensitive = false
}

output "my-email" {
  value = data.google_client_openid_userinfo.me.email
}

output "ampere_taut2a_metadata" {
  value = google_compute_instance.default.*.metadata
  sensitive = false
}

