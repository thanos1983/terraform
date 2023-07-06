output "id" {
  description = "The ID of the Data Factory."
  value       = azurerm_data_factory_integration_runtime_self_hosted.data_factory_integration_runtime_self_hosted.id
}

output "primary_authorization_key" {
  description = "The primary integration runtime authentication key."
  value       = azurerm_data_factory_integration_runtime_self_hosted.data_factory_integration_runtime_self_hosted.primary_authorization_key
}

output "secondary_authorization_key" {
  description = "The secondary integration runtime authentication key."
  value       = azurerm_data_factory_integration_runtime_self_hosted.data_factory_integration_runtime_self_hosted.secondary_authorization_key
}