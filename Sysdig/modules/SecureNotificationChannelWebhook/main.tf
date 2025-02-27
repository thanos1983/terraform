resource "sysdig_secure_notification_channel_webhook" "secure_notification_channel_webhook" {
  name                       = var.name
  url                        = var.url
  custom_data                = var.custom_data
  enabled                    = var.enabled
  notify_when_ok             = var.notify_when_ok
  notify_when_resolved       = var.notify_when_resolved
  send_test_notification     = var.send_test_notification
  share_with_current_team    = var.share_with_current_team
  allow_insecure_connections = var.allow_insecure_connections
}