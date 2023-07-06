output "id" {
  description = "The ID of the Data Factory SQL Server Dataset."
  value       = azurerm_data_factory_dataset_sql_server_table.data_factory_dataset_sql_server_table[*].id
}

output "name" {
  description = "The name of the Data Factory SQL Server Dataset."
  value       = azurerm_data_factory_dataset_sql_server_table.data_factory_dataset_sql_server_table[*].name
}