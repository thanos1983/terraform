output "id" {
  description = "Unique ID of the Volume Attachment."
  value       = hcloud_volume_attachment.volume_attachment.id
}

output "volume_id" {
  description = "ID of the Volume."
  value       = hcloud_volume_attachment.volume_attachment.volume_id
}

output "server_id" {
  description = "Server the Volume was attached to."
  value       = hcloud_volume_attachment.volume_attachment.server_id
}
