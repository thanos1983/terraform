output "id" {
  description = "Specifies the ID of the network security group."
  value       = azurerm_network_security_group.network_security_group.id
}

output "name" {
  description = "Specifies the name of the network security group."
  value       = azurerm_network_security_group.network_security_group.name
}