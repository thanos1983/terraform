output "id" {
  description = "The ID of the Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_custom.logic_app_trigger_custom.id
}

output "name" {
  description = "The Name of the Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_custom.logic_app_trigger_custom.name
}