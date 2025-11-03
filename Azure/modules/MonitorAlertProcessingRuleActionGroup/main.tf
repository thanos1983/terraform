resource "azurerm_monitor_alert_processing_rule_action_group" "monitor_alert_processing_rule_action_group" {
  add_action_group_ids = var.add_action_group_ids
  name                 = var.name
  resource_group_name  = var.resource_group_name
  scopes               = var.scopes

  dynamic "condition" {
    for_each = var.condition_block[*]
    content {
      dynamic "alert_context" {
        for_each = condition.value.alert_context_block[*]
        content {
          operator = alert_context.value.operator
          values   = alert_context.value.values
        }
      }
      dynamic "alert_rule_id" {
        for_each = condition.value.alert_rule_id_block[*]
        content {
          operator = alert_rule_id.value.operator
          values   = alert_rule_id.value.values
        }
      }
      dynamic "alert_rule_name" {
        for_each = condition.value.alert_rule_name_block[*]
        content {
          operator = alert_rule_name.value.operator
          values   = alert_rule_name.value.values
        }
      }
      dynamic "description" {
        for_each = condition.value.description_block[*]
        content {
          operator = description.value.operator
          values   = description.value.values
        }
      }
      dynamic "monitor_condition" {
        for_each = condition.value.monitor_condition_block[*]
        content {
          operator = monitor_condition.value.operator
          values   = monitor_condition.value.values
        }
      }
      dynamic "monitor_service" {
        for_each = condition.value.monitor_service_block[*]
        content {
          operator = monitor_service.value.operator
          values   = monitor_service.value.values
        }
      }
      dynamic "severity" {
        for_each = condition.value.severity_block[*]
        content {
          operator = severity.value.operator
          values   = severity.value.values
        }
      }
      dynamic "signal_type" {
        for_each = condition.value.signal_type_block[*]
        content {
          operator = signal_type.value.operator
          values   = signal_type.value.values
        }
      }
      dynamic "target_resource" {
        for_each = condition.value.target_resource_block[*]
        content {
          operator = target_resource.value.operator
          values   = target_resource.value.values
        }
      }
      dynamic "target_resource_group" {
        for_each = condition.value.target_resource_group_block[*]
        content {
          operator = target_resource_group.value.operator
          values   = target_resource_group.value.values
        }
      }
      dynamic "target_resource_type" {
        for_each = condition.value.target_resource_type_block[*]
        content {
          operator = target_resource_type.value.operator
          values   = target_resource_type.value.values
        }
      }
    }
  }

  description = var.description
  enabled     = var.enabled

  dynamic "schedule" {
    for_each = var.schedule_block[*]
    content {
      effective_from  = schedule.value.effective_from
      effective_until = schedule.value.effective_until
      dynamic "recurrence" {
        for_each = schedule.value.recurrence_block[*]
        content {
          dynamic "daily" {
            for_each = recurrence.value.daily_block[*]
            content {
              start_time = daily.value.start_time
              end_time   = daily.value.end_time
            }
          }
          dynamic "weekly" {
            for_each = recurrence.value.weekly_block[*]
            content {
              days_of_week = weekly.value.days_of_week
              start_time   = weekly.value.start_time
              end_time     = weekly.value.end_time
            }
          }
          dynamic "monthly" {
            for_each = recurrence.value.monthly_block[*]
            content {
              days_of_month = monthly.value.days_of_month
              start_time    = monthly.value.start_time
              end_time      = monthly.value.end_time
            }
          }
        }
      }
      time_zone = schedule.value.time_zone
    }
  }

  tags = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
