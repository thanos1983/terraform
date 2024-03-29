output "id" {
  description = "The ID of the HTTP Action within the Logic App Workflow."
  value       = azurerm_logic_app_action_http.logic_app_action_http.id
}

output "name" {
  description = "The Name of the HTTP Action within the Logic App Workflow."
  value       = azurerm_logic_app_action_http.logic_app_action_http.name
}