output "id" {
  description = "The ID of the SQL virtual network rule."
  value       = azurerm_mssql_virtual_network_rule.mssql_virtual_network_rule.id
}

output "name" {
  description = "The name of the SQL virtual network rule."
  value       = azurerm_mssql_virtual_network_rule.mssql_virtual_network_rule.name
}
