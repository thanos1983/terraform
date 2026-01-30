resource "sysdig_secure_notification_channel_email" "secure_notification_channel_email" {
  name                    = var.name
  recipients              = var.recipients
  enabled                 = var.enabled
  send_test_notification  = var.send_test_notification
  share_with_current_team = var.share_with_current_team
}