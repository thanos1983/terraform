resource "sysdig_secure_notification_channel_prometheus_alert_manager" "secure_notification_channel_prometheus_alert_manager" {
  name                       = var.name
  url                        = var.url
  additional_headers         = var.additional_headers
  allow_insecure_connections = var.allow_insecure_connections
  enabled                    = var.enabled
  notify_when_ok             = var.notify_when_ok
  notify_when_resolved       = var.notify_when_resolved
  send_test_notification     = var.send_test_notification
  share_with_current_team    = var.share_with_current_team
}