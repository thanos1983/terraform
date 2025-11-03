output "id" {
  description = "The ID of the Data Factory Azure SQL Server Dataset."
  value       = azapi_resource.df_dataset_azure_sql_server.id
}

output "name" {
  description = "The name of the Data Factory Azure SQL Server Dataset."
  value       = azapi_resource.df_dataset_azure_sql_server.name
}
