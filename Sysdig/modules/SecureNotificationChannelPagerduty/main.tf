resource "sysdig_secure_notification_channel_pagerduty" "secure_notification_channel_pagerduty" {
  name                    = var.name
  account                 = var.account
  service_key             = var.service_key
  service_name            = var.service_name
  enabled                 = var.enabled
  notify_when_ok          = var.notify_when_ok
  notify_when_resolved    = var.notify_when_resolved
  send_test_notification  = var.send_test_notification
  share_with_current_team = var.share_with_current_team
}