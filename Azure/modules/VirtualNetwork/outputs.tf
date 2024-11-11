output "id" {
  description = "The id of the virtual network."
  value       = azurerm_virtual_network.virtual_network.id
}

output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.virtual_network.name
}

output "resource_group_name" {
  description = "The resource group name of the virtual network."
  value       = azurerm_virtual_network.virtual_network.resource_group_name
}

output "location" {
  description = "The resource group location of the virtual network."
  value       = azurerm_virtual_network.virtual_network.location
}

output "address_space" {
  description = "The address space of the virtual network."
  value       = azurerm_virtual_network.virtual_network.address_space
}

output "guid" {
  description = "The GUID of the virtual network."
  value       = azurerm_virtual_network.virtual_network.guid
}

output "subnet" {
  description = "One or more subnet blocks as defined below."
  value       = azurerm_virtual_network.virtual_network.subnet
}