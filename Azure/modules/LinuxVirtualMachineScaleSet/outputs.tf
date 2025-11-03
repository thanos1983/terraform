output "admin_username" {
  sensitive   = true
  description = "The admin username of the Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.admin_username
}

output "admin_password" {
  sensitive   = true
  description = "The admin password of the Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.admin_password
}

output "id" {
  description = "The ID of the Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.id
}

output "name" {
  description = "The name of the Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.name
}

output "identity" {
  description = "An identity block as defined below, which contains the Managed Service Identity information for this azure resource."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.identity
}

output "unique_id" {
  description = "The Unique ID for this Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux_virtual_machine_scale_set.unique_id
}
