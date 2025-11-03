output "id" {
  description = "The ID of the Action Group."
  value       = azurerm_monitor_action_group.monitor_action_group.id
}

output "name" {
  description = "The Name of the Action Group."
  value       = azurerm_monitor_action_group.monitor_action_group.name
}
