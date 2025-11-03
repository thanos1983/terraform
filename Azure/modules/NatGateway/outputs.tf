output "id" {
  description = "The ID of the NAT Gateway."
  value       = azurerm_nat_gateway.nat_gateway.id
}

output "name" {
  description = "The name of the NAT Gateway."
  value       = azurerm_nat_gateway.nat_gateway.name
}

output "resource_guid" {
  description = "The resource GUID property of the NAT Gateway."
  value       = azurerm_nat_gateway.nat_gateway.resource_guid
}
