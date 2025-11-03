output "id" {
  description = "The ID of the Alert Processing Rule."
  value       = azurerm_monitor_alert_processing_rule_action_group.monitor_alert_processing_rule_action_group.id
}

output "name" {
  description = "The Name of the Alert Processing Rule."
  value       = azurerm_monitor_alert_processing_rule_action_group.monitor_alert_processing_rule_action_group.name
}
