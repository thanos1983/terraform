output "id" {
  description = "The id of the Data Factory Linked Service Azure SQL Database."
  value       = azurerm_data_factory_linked_service_key_vault.data_factory_linked_service_key_vault.id
}

output "name" {
  description = "The name of the Data Factory Linked Service Azure SQL Database."
  value       = azurerm_data_factory_linked_service_key_vault.data_factory_linked_service_key_vault.name
}