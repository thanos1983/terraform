output "id" {
  description = "The ID of the Management Group."
  value       = azurerm_management_group.management_group.id
}

output "name" {
  description = "The Name of the Management Group."
  value       = azurerm_management_group.management_group.name
}
