output "id" {
  description = "Unique ID of the Primary IP."
  value       = hcloud_primary_ip.primary_ip.id
}

output "type" {
  description = "Type of the Primary IP."
  value       = hcloud_primary_ip.primary_ip.type
}

output "datacenter" {
  description = "The datacenter of the Primary IP."
  value       = hcloud_primary_ip.primary_ip.datacenter
}

output "name" {
  description = "Name of the Primary IP."
  value       = hcloud_primary_ip.primary_ip.name
}

output "auto_delete" {
  description = "Whether auto delete is enabled."
  value       = hcloud_primary_ip.primary_ip.auto_delete
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_primary_ip.primary_ip.type
}

output "ip_address" {
  description = "IP Address of the Primary IP."
  value       = hcloud_primary_ip.primary_ip.ip_address
}

output "assignee_id" {
  description = "ID of the assigned resource."
  value       = hcloud_primary_ip.primary_ip.assignee_id
}

output "assignee_type" {
  description = "The type of the assigned resource."
  value       = hcloud_primary_ip.primary_ip.assignee_type
}

output "delete_protection" {
  description = "Whether delete protection is enabled."
  value       = hcloud_primary_ip.primary_ip.delete_protection
}
