output "id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.network_interface.id
}

output "name" {
  description = "The name of the Network Interface."
  value       = azurerm_network_interface.network_interface.name
}

output "applied_dns_servers" {
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
  value       = azurerm_network_interface.network_interface.applied_dns_servers
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

output "ip_configuration" {
  description = "The One or more ip_configuration blocks as defined below."
  value       = azurerm_network_interface.network_interface.ip_configuration
}
