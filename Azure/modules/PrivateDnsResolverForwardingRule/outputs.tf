output "id" {
  description = "The ID of the Private DNS Resolver Forwarding Rule."
  value       = azurerm_private_dns_resolver_forwarding_rule.private_dns_resolver_forwarding_rule.id
}

output "name" {
  description = "The name of the Private DNS Resolver Forwarding Rule."
  value       = azurerm_private_dns_resolver_forwarding_rule.private_dns_resolver_forwarding_rule.name
}
