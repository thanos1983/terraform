output "id" {
  description = "The ID of the Shared Image."
  value       = azurerm_shared_image.shared_image.id
}

output "name" {
  description = "The name of the Shared Image."
  value       = azurerm_shared_image.shared_image.name
}
