resource "sysdig_secure_notification_channel_slack" "secure_notification_channel_slack" {
  name                    = var.name
  url                     = var.url
  channel                 = var.channel
  enabled                 = var.enabled
  notify_when_ok          = var.notify_when_ok
  notify_when_resolved    = var.notify_when_resolved
  send_test_notification  = var.send_test_notification
  template_version        = var.template_version
  share_with_current_team = var.share_with_current_team
}