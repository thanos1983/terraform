resource "sysdig_secure_policy" "secure_policy" {
  name        = var.name
  description = var.description
  severity    = var.severity
  enabled     = var.enabled
  type        = var.type
  runbook     = var.runbook
  scope       = var.scope

  dynamic "actions" {
    for_each = var.actions_block[*]
    content {
      container = actions.value.container
      dynamic "capture" {
        for_each = actions.value.capture_block[*]
        content {
          seconds_before_event = capture.value.seconds_before_event
          seconds_after_event  = capture.value.seconds_after_event
          name                 = capture.value.name
          filter               = capture.value.filter
          bucket_name          = capture.value.bucket_name
          folder               = capture.value.folder
        }
      }
    }
  }

  rule_names            = var.rule_names
  notification_channels = var.notification_channels
}