output "id" {
  description = "The Logic App Workflow ID."
  value       = azurerm_logic_app_workflow.logic_app_workflow.id
}

output "name" {
  description = "The Logic App Workflow Name."
  value       = azurerm_logic_app_workflow.logic_app_workflow.name
}

output "access_endpoint" {
  description = "The Access Endpoint for the Logic App Workflow."
  value       = azurerm_logic_app_workflow.logic_app_workflow.access_endpoint
}

output "connector_endpoint_ip_addresses" {
  description = "The list of access endpoint IP addresses of connector."
  value       = azurerm_logic_app_workflow.logic_app_workflow.connector_endpoint_ip_addresses
}

output "connector_outbound_ip_addresses" {
  description = "The list of outgoing IP addresses of connector."
  value       = azurerm_logic_app_workflow.logic_app_workflow.connector_outbound_ip_addresses
}

output "identity" {
  description = "The identity block exports the following ('Principal ID' and 'Tenant ID')."
  value       = azurerm_logic_app_workflow.logic_app_workflow.identity
}

output "workflow_endpoint_ip_addresses" {
  description = "The list of access endpoint IP addresses of workflow."
  value       = azurerm_logic_app_workflow.logic_app_workflow.workflow_endpoint_ip_addresses
}

output "workflow_outbound_ip_addresses" {
  description = "The list of outgoing IP addresses of workflow."
  value       = azurerm_logic_app_workflow.logic_app_workflow.workflow_outbound_ip_addresses
}