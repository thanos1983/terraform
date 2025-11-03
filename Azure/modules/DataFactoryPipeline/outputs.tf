output "id" {
  description = "The ID of the Data Factory Pipeline."
  value       = azurerm_data_factory_pipeline.data_factory_pipeline[*].id
}

output "name" {
  description = "The Name of the Data Factory Pipeline."
  value       = azurerm_data_factory_pipeline.data_factory_pipeline[*].name
}
