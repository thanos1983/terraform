output "id" {
  description = "The ID of the security rule."
  value = azurerm_network_security_rule.network_security_rule.id
}

output "name" {
  description = "The name of the security rule."
  value       = azurerm_network_security_rule.network_security_rule.name
}