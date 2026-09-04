output "id" {
  description = "The ID of the Recurrence Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrence.id
}

output "name" {
  description = "The Name of the Recurrence Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrence.name
}