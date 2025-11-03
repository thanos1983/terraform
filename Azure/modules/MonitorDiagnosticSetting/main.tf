resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                           = var.name
  target_resource_id             = var.target_resource_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id

  dynamic "enabled_log" {
    for_each = var.enabled_log_blocks
    content {
      category       = enabled_log.value.category
      category_group = enabled_log.value.category_group
    }
  }

  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enable_metric" {
    for_each = var.enabled_metric_blocks
    content {
      category = enable_metric.value.category
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
