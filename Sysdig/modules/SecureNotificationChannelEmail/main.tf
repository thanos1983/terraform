resource "sysdig_secure_notification_channel_email" "secure_notification_channel_email" {
  name                    = var.name
  recipients              = var.recipients
  enabled                 = var.enabled
  notify_when_ok          = var.notify_when_ok
  notify_when_resolved    = var.notify_when_resolved
  send_test_notification  = var.send_test_notification
  share_with_current_team = var.share_with_current_team
}