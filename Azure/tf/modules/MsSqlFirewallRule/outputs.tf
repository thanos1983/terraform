output "id" {
  description = "The SQL Firewall Rule ID."
  value       = azurerm_mssql_firewall_rule.mssql_firewall_rule.id
}

output "name" {
  description = "The SQL Firewall Rule Name."
  value       = azurerm_mssql_firewall_rule.mssql_firewall_rule.name
}