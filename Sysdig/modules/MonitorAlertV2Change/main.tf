resource "sysdig_monitor_alert_v2_change" "monitor_alert_v2_change" {
  name        = var.name
  description = var.description
  group       = var.group
  severity    = var.severity
  enabled     = var.enabled

  dynamic "notification_channels" {
    for_each = var.notification_channels_blocks
    content {
      id                     = notification_channels.value.id
      renotify_every_minutes = notification_channels.value.renotify_every_minutes
      notify_on_resolve      = notification_channels.value.notify_on_resolve
      main_threshold         = notification_channels.value.main_threshold
      warning_threshold      = notification_channels.value.warning_threshold
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
  time_aggregation                                 = var.time_aggregation
  group_aggregation                                = var.group_aggregation
  operator                                         = var.operator
  threshold                                        = var.threshold
  warning_threshold                                = var.warning_threshold
  shorter_time_range_seconds                       = var.shorter_time_range_seconds
  longer_time_range_seconds                        = var.longer_time_range_seconds
  unreported_alert_notifications_retention_seconds = var.unreported_alert_notifications_retention_seconds
}