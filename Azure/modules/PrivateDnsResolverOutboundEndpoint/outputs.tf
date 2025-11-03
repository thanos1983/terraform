output "id" {
  description = "The ID of the Private DNS Resolver Outbound Endpoint."
  value       = azurerm_private_dns_resolver_outbound_endpoint.private_dns_resolver_outbound_endpoint.id
}

output "name" {
  description = "Specifies the name which should be used for this Private DNS Resolver Outbound Endpoint."
  value       = azurerm_private_dns_resolver_outbound_endpoint.private_dns_resolver_outbound_endpoint.name
}
