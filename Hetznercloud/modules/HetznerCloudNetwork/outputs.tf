output "id" {
  description = "Unique ID of the network."
  value       = hcloud_network.network.id
}

output "name" {
  description = "Name of the network."
  value       = hcloud_network.network.name
}

output "ip_range" {
  description = "IPv4 Prefix of the whole Network."
  value       = hcloud_network.network.ip_range
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_network.network.labels
}

output "delete_protection" {
  description = "Whether delete protection is enabled."
  value       = hcloud_network.network.delete_protection
}

output "expose_routes_to_vswitch" {
  description = "expose_routes_to_vswitchIndicates if the routes from this network should be exposed to the vSwitch connection."
  value       = hcloud_network.network.expose_routes_to_vswitch
}
