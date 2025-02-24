output "id" {
  description = "The ID of the Notification Channel."
  value       = sysdig_secure_notification_channel_email.secure_notification_channel_email.id
}

output "version" {
  description = "The current version of the Notification Channel."
  value       = sysdig_secure_notification_channel_email.secure_notification_channel_email.version
}
