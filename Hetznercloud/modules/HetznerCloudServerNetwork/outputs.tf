output "id" {
  description = "ID of the server network."
  value       = hcloud_server_network.server_network.id
}

output "network_id" {
  description = "ID of the network."
  value       = hcloud_server_network.server_network.network_id
}

output "server_id" {
  description = "ID of the server."
  value       = hcloud_server_network.server_network.server_id
}

output "ip" {
  description = "IP assigned to this server."
  value       = hcloud_server_network.server_network.ip
}

output "alias_ips" {
  description = "Additional IPs to be assigned to this server."
  value       = hcloud_server_network.server_network.alias_ips
}
