output "id" {
  description = "The ID of the Ms SQL Database."
  value       = azurerm_mssql_database.mssql_database.id
}

output "name" {
  description = "The DB name of the Ms SQL Database"
  value       = azurerm_mssql_database.mssql_database.name
}

output "fully_qualified_domain_name" {
  description = "TheDB fully qualified domain name."
  value       = "${azurerm_mssql_database.mssql_database.name}.database.windows.net"
}