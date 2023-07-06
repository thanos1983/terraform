output "id" {
  description = "The ID of the Virtual Network Gateway."
  value       = azurerm_virtual_network_gateway.virtual_network_gateway.id
}

output "name" {
  description = "The name of the Virtual Network Gateway."
  value       = azurerm_virtual_network_gateway.virtual_network_gateway.name
}