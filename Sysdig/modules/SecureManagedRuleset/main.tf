resource "sysdig_secure_managed_ruleset" "secure_managed_ruleset" {
  name        = var.name
  description = var.description
  severity    = var.severity
  enabled     = var.enabled
  type        = var.type
  runbook     = var.runbook

  dynamic "inherited_from" {
    for_each = var.inherited_from_block[*]
    content {
      name = inherited_from.value.name
      type = inherited_from.value.type
    }
  }

  scope = var.scope

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

  disabled_rules        = var.disabled_rules
  notification_channels = var.notification_channels
}