resource "sysdig_secure_notification_channel_msteams" "secure_notification_channel_msteams" {
  name                   = var.name
  url                    = var.url
  enabled                = var.enabled
  notify_when_ok         = var.notify_when_ok
  notify_when_resolved   = var.notify_when_resolved
  send_test_notification = var.send_test_notification
  template_version       = var.template_version
}