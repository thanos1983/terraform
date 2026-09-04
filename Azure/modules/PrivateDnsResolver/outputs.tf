output "id" {
  description = "The ID of the DNS Resolver."
  value       = azurerm_private_dns_resolver.private_dns_resolver.id
}

output "name" {
  description = "The Name of the DNS Resolver."
  value       = azurerm_private_dns_resolver.private_dns_resolver.name
}