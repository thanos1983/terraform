output "id" {
  description = "The Microsoft SQL Server ID."
  value       = azurerm_mssql_server.mssql_server.id
}

output "name" {
  description = "The name of the Microsoft SQL Server."
  value       = azurerm_mssql_server.mssql_server.name
}

output "resource_group_name" {
  description = "The resource group name of the Microsoft SQL Server."
  value       = azurerm_mssql_server.mssql_server.resource_group_name
}

output "administrator_login" {
  description = "The username set for MSSQL Server."
  value       = azurerm_mssql_server.mssql_server.administrator_login
  sensitive   = true
}

output "administrator_login_password" {
  description = "The password set for MSSQL Server."
  value       = azurerm_mssql_server.mssql_server.administrator_login_password
  sensitive   = true
}

output "fully_qualified_domain_name" {
  description = "The fully qualified domain name of the Azure SQL Server (e.g. myServerName.database.windows.net)"
  value       = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}

output "restorable_dropped_database_ids" {
  description = "A list of dropped restorable database IDs on the server.A list of dropped restorable database IDs on the server."
  value       = azurerm_mssql_server.mssql_server.restorable_dropped_database_ids
}