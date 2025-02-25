output "id" {
  description = "The ID of the Notification Channel."
  value       = sysdig_secure_notification_channel_msteams.secure_notification_channel_msteams.id
}

output "version" {
  description = "The current version of the Notification Channel."
  value       = sysdig_secure_notification_channel_msteams.secure_notification_channel_msteams.version
}

output "share_with_current_team" {
  description = "If set to true it will share notification channel only with current team (in which user is logged in)."
  value       = sysdig_secure_notification_channel_msteams.secure_notification_channel_msteams.share_with_current_team
}
