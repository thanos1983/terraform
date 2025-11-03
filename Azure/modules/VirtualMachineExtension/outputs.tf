output "id" {
  description = "The ID of the Virtual Machine Extension."
  value       = azurerm_virtual_machine_extension.virtual_machine_extension.id
}

output "name" {
  description = "The Name of the Virtual Machine Extension."
  value       = azurerm_virtual_machine_extension.virtual_machine_extension.name
}
