output "id" {
  description = "Unique ID of the server."
  value       = hcloud_server.server.id
}

output "name" {
  description = "Name of the server."
  value       = hcloud_server.server.name
}

output "server_type" {
  description = "Name of the server type."
  value       = hcloud_server.server.server_type
}

output "image" {
  description = "Name or ID of the image the server was created from."
  value       = hcloud_server.server.image
}

output "location" {
  description = "The location name."
  value       = hcloud_server.server.location
}

output "datacenter" {
  description = "The datacenter name."
  value       = hcloud_server.server.datacenter
}

output "backups" {
  description = "Whether backups are enabled."
  value       = hcloud_server.server.backups
}

output "iso" {
  description = "ID or Name of the mounted ISO image."
  value       = hcloud_server.server.iso
}

output "ipv4_address" {
  description = "The IPv4 address."
  value       = hcloud_server.server.ipv4_address
}

output "ipv6_address" {
  description = "The IPv6 address."
  value       = hcloud_server.server.ipv6_address
}

output "status" {
  description = "The status of the server."
  value       = hcloud_server.server.status
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_server.server.labels
}

output "network" {
  description = "Private Network the server shall be attached to."
  value       = hcloud_server.server.network
}

output "firewall_ids" {
  description = "Firewall IDs the server is attached to."
  value       = hcloud_server.server.firewall_ids
}

output "placement_group_id" {
  description = "Placement Group ID the server is assigned to."
  value       = hcloud_server.server.placement_group_id
}

output "delete_protection" {
  description = "Whether delete protection is enabled."
  value       = hcloud_server.server.delete_protection
}

output "rebuild_protection" {
  description = "Whether rebuild protection is enabled."
  value       = hcloud_server.server.rebuild_protection
}

output "shutdown_before_deletion" {
  description = "Whether the server will try to shut down gracefully before being deleted."
  value       = hcloud_server.server.shutdown_before_deletion
}

output "primary_disk_size" {
  description = "The size of the primary disk in GB."
  value       = hcloud_server.server.primary_disk_size
}
