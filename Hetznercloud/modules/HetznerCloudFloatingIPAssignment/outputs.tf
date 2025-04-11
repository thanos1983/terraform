output "id" {
  description = "Unique ID of the Floating IP Assignment."
  value       = hcloud_floating_ip_assignment.floating_ip_assignment.id
}

output "floating_ip_id" {
  description = "ID of the Floating IP."
  value       = hcloud_floating_ip_assignment.floating_ip_assignment.floating_ip_id
}

output "server_id" {
  description = "Server the Floating IP was assigned to."
  value       = hcloud_floating_ip_assignment.floating_ip_assignment.server_id
}
