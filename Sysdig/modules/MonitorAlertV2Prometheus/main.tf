resource "sysdig_monitor_alert_v2_prometheus" "monitor_alert_v2_prometheus" {
  name             = var.name
  description      = var.description
  duration_seconds = var.duration_seconds
  group            = var.group
  severity         = var.severity
  enabled          = var.enabled

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

  labels                  = var.labels
  query                   = var.query
  keep_firing_for_minutes = var.keep_firing_for_minutes
}