output "id" {
  description = "Unique ID of the Floating IP."
  value       = hcloud_floating_ip.floating_ip.id
}

output "type" {
  description = "Type of the Floating IP."
  value       = hcloud_floating_ip.floating_ip.type
}

output "name" {
  description = "Name of the Floating IP."
  value       = hcloud_floating_ip.floating_ip.name
}

output "server_id" {
  description = "Server to assign the Floating IP is assigned to."
  value       = hcloud_floating_ip.floating_ip.server_id
}

output "home_location" {
  description = "Home location."
  value       = hcloud_floating_ip.floating_ip.home_location
}

output "description" {
  description = "Description of the Floating IP."
  value       = hcloud_floating_ip.floating_ip.description
}

output "ip_address" {
  description = "IP Address of the Floating IP."
  value       = hcloud_floating_ip.floating_ip.ip_address
}

output "ip_network" {
  description = "IPv6 subnet. (Only set if type is ipv6)."
  value       = hcloud_floating_ip.floating_ip.ip_network
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_floating_ip.floating_ip.labels
}

output "delete_protection" {
  description = "Whether delete protection is enabled."
  value       = hcloud_floating_ip.floating_ip.delete_protection
}
