output "id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.network_interface.id
}

output "name" {
  description = "The name of the Network Interface."
  value       = azurerm_network_interface.network_interface.name
}

output "internal_domain_name_suffix" {
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM."
  value       = azurerm_network_interface.network_interface.internal_domain_name_suffix
}

output "mac_address" {
  description = "The Media Access Control (MAC) Address of the Network Interface."
  value       = azurerm_network_interface.network_interface.mac_address
}

output "private_ip_address" {
  description = "The first private IP address of the network interface."
  value       = azurerm_network_interface.network_interface.private_ip_address
}

output "private_ip_addresses" {
  description = "The private IP addresses of the network interface."
  value       = azurerm_network_interface.network_interface.private_ip_addresses
}

output "virtual_machine_id" {
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
  value       = azurerm_network_interface.network_interface.virtual_machine_id
}