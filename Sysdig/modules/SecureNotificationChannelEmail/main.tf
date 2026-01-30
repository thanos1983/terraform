resource "sysdig_secure_notification_channel_email" "secure_notification_channel_email" {
  name                    = var.name
  recipients              = var.recipients
  enabled                 = var.enabled
  notify_on_resolve       = var.notify_on_resolve
  notify_when_resolved    = var.notify_on_acknowledge
  send_test_notification  = var.send_test_notification
  share_with_current_team = var.share_with_current_team
}