output "id" {
  description = "The ID of the Notification Channel."
  value       = sysdig_secure_notification_channel_webhook.secure_notification_channel_webhook.id
}

output "version" {
  description = "The current version of the Notification Channel."
  value       = sysdig_secure_notification_channel_webhook.secure_notification_channel_webhook.version
}

output "share_with_current_team" {
  description = "If set to true it will share notification channel only with current team (in which user is logged in)."
  value       = sysdig_secure_notification_channel_webhook.secure_notification_channel_webhook.share_with_current_team
}