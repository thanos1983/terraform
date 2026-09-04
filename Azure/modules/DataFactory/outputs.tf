output "id" {
  description = "The ID of the Data Factory."
  value       = azurerm_data_factory.data_factory.id
}

output "name" {
  description = "The name of the Data Factory."
  value       = azurerm_data_factory.data_factory.name
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = azurerm_data_factory.data_factory.identity.0.principal_id
}

output "tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity."
  value       = azurerm_data_factory.data_factory.identity.0.tenant_id
}