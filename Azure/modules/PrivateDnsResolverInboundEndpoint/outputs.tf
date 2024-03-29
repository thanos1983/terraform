output "id" {
  description = "The ID of the Private DNS Resolver Inbound Endpoint."
  value       = azurerm_private_dns_resolver_inbound_endpoint.private_dns_resolver_inbound_endpoint.id
}

output "name" {
  description = "Specifies the name which should be used for this Private DNS Resolver Outbound Endpoint."
  value       = azurerm_private_dns_resolver_inbound_endpoint.private_dns_resolver_inbound_endpoint.name
}

output "ip_configurations" {
  description = "An ip_configurations block exports the following."
  value       = azurerm_private_dns_resolver_inbound_endpoint.private_dns_resolver_inbound_endpoint.ip_configurations
}