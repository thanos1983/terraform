output "id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "resource_group_name" {
  value = azurerm_virtual_network.virtual_network.resource_group_name
}

output "location" {
  value = azurerm_virtual_network.virtual_network.location
}

output "address_space" {
  value = azurerm_virtual_network.virtual_network.address_space
}

output "guid" {
  value = azurerm_virtual_network.virtual_network.guid
}

output "subnet" {
  value = azurerm_virtual_network.virtual_network.subnet
}

output "tenant_id" {
  description = "The ID of this subnet."
  value = zipmap( values(azurerm_virtual_network.virtual_network.subnet)[*].name, values(azurerm_virtual_network.virtual_network.subnet)[*].id )
}