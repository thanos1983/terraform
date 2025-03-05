resource "sysdig_monitor_alert_v2_downtime" "monitor_alert_v2_downtime" {
  name          = var.name
  description   = var.description
  range_seconds = var.range_seconds
  group         = var.group
  severity      = var.severity
  enabled       = var.enabled

  dynamic "notification_channels" {
    for_each = var.notification_channels_blocks
    content {
      id                     = notification_channels.value.id
      renotify_every_minutes = notification_channels.value.renotify_every_minutes
      notify_on_resolve      = notification_channels.value.notify_on_resolve
    }
  }

  dynamic "custom_notification" {
    for_each = var.custom_notification_block[*]
    content {
      subject = custom_notification.value.subject
      prepend = custom_notification.value.prepend
      append  = custom_notification.value.append
    }
  }

  dynamic "link" {
    for_each = var.link_blocks
    content {
      type = link.value.type
      href = link.value.href
      id   = link.value.id
    }
  }

  labels = var.labels

  dynamic "capture" {
    for_each = var.capture_block[*]
    content {
      filename         = capture.value.filename
      duration_seconds = capture.value.duration_seconds
      storage          = capture.value.storage
      filter           = capture.value.filter
      enabled          = capture.value.enabled
    }
  }

  dynamic "scope" {
    for_each = var.scope_blocks
    content {
      label    = scope.value.label
      operator = scope.value.operator
      values   = scope.value.values
    }
  }

  group_by                                         = var.group_by
  metric                                           = var.metric
  threshold                                        = var.threshold
  unreported_alert_notifications_retention_seconds = var.unreported_alert_notifications_retention_seconds
}