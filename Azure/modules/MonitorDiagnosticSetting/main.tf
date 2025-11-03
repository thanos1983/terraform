resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                           = var.name
  target_resource_id             = var.target_resource_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id

  dynamic "enabled_log" {
    for_each = var.enabled_log_block[*]
    content {
      category       = enabled_log.value.category
      category_group = enabled_log.value.category_group
      dynamic "retention_policy" {
        for_each = enabled_log.value.retention_policy[*]
        content {
          enabled = retention_policy.value.enabled
          days    = retention_policy.value.days
        }
      }
    }
  }

  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "metric" {
    for_each = var.metric_block[*]
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
      dynamic "retention_policy" {
        for_each = metric.value.retention_policy[*]
        content {
          enabled = retention_policy.value.enabled
          days    = retention_policy.value.days
        }
      }
    }
  }

  storage_account_id             = var.storage_account_id
  log_analytics_destination_type = var.log_analytics_destination_type
  partner_solution_id            = var.partner_solution_id

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
