output "id" {
  description = "The ID of the HTTP Request Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_http_request.logic_app_trigger_http_request.id
}

output "name" {
  description = "The Name of the HTTP Request Trigger within the Logic App Workflow."
  value       = azurerm_logic_app_trigger_http_request.logic_app_trigger_http_request.name
}

output "callback_url" {
  description = "The URL for the workflow trigger."
  value       = azurerm_logic_app_trigger_http_request.logic_app_trigger_http_request.callback_url
}
