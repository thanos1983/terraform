output "admin_username" {
  sensitive   = true
  description = "The Administrator Username Windows Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.admin_username
}

output "admin_password" {
  sensitive   = true
  description = "The Administrator Password Windows Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.admin_password
}

output "id" {
  description = "The ID of the Windows Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.id
}

output "name" {
  description = "The Name assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.name
}

output "identity" {
  description = "An identity block as defined below, which contains the Managed Service Identity information for this azure resource."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.identity
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = flatten([
    for identity in azurerm_linux_virtual_machine.linux_virtual_machine[*].identity : identity[*].principal_id
  ])
}

output "tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity."
  value       = flatten([
    for identity in azurerm_linux_virtual_machine.linux_virtual_machine[*].identity : identity[*].tenant_id
  ])
}

output "private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.private_ip_address
}

output "private_ip_addresses" {
  description = "A list of Private IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.private_ip_addresses
}

output "public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.public_ip_address
}

output "public_ip_addresses" {
  description = "A list of the Public IP Addresses assigned to this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.public_ip_addresses
}

output "virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine."
  value       = azurerm_linux_virtual_machine.linux_virtual_machine.virtual_machine_id
}