resource "sysdig_monitor_silence_rule" "monitor_silence_rule" {
  name             = var.name
  enabled          = ""
  start_ts         = ""
  duration_seconds = ""
  scope            = ""
  alert_ids = []
  notification_channel_ids = []
}