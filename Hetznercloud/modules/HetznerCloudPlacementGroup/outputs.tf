output "id" {
  description = "Unique ID of the Placement Group."
  value       = hcloud_placement_group.placement_group.id
}

output "name" {
  description = "Name of the Placement Group."
  value       = hcloud_placement_group.placement_group.name
}

output "certificate_domain" {
  description = "Type of the Placement Group."
  value       = hcloud_placement_group.placement_group.type
}

output "private_key_pem" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_placement_group.placement_group.labels
}
