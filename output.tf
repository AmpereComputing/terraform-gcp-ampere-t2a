# Output the private and public IPs of the instance

# NEED TO CHANGE TO PRIVATE IP - WIP
output "ampere_taut2a_private_ips" {
  value =  ["${google_compute_instance.vnet.network_interface.0.access_config.0.nat_ip}"]
  sensitive = false
}

output "ampere_taut2a_public_ips" {
  value =  ["${google_compute_instance.vnet.network_interface.0.access_config.0.nat_ip}]
  sensitive = false
}
