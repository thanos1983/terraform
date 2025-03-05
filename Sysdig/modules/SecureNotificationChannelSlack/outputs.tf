output "id" {
  description = "The ID of the Notification Channel."
  value       = sysdig_secure_notification_channel_slack.secure_notification_channel_slack.id
}

output "name" {
  description = "The name of the Notification Channel."
  value       = sysdig_secure_notification_channel_slack.secure_notification_channel_slack.name
}

output "version" {
  description = "The version of the Notification Channel."
  value       = sysdig_secure_notification_channel_slack.secure_notification_channel_slack.version
}
