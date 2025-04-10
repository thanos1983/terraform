output "id" {
  description = "ID of the Network subnet."
  value       = hcloud_network_subnet.network_subnet.id
}

output "network_id" {
  description = "ID of the Network."
  value       = hcloud_network_subnet.network_subnet.id
}

output "type" {
  description = "Type of subnet."
  value       = hcloud_network_subnet.network_subnet.type
}

output "ip_range" {
  description = "Range to allocate IPs from."
  value       = hcloud_network_subnet.network_subnet.ip_range
}

output "network_zone" {
  description = "Name of network zone."
  value       = hcloud_network_subnet.network_subnet.network_zone
}

output "vswitch_id" {
  description = "ID of the vswitch, when type is vswitch."
  value       = hcloud_network_subnet.network_subnet.vswitch_id
}
