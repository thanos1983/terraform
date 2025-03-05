resource "sysdig_monitor_silence_rule" "monitor_silence_rule" {
  name                     = var.name
  enabled                  = var.enabled
  start_ts                 = var.start_ts
  duration_seconds         = var.duration_seconds
  scope                    = var.scope
  alert_ids                = var.alert_ids
  notification_channel_ids = var.notification_channel_ids
}