output "id" {
  description = "The ID of the File Share."
  value       = azurerm_storage_share.storage_share.id
}

output "name" {
  description = "The ID of the File Share."
  value       = azurerm_storage_share.storage_share.name
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this File Share."
  value       = azurerm_storage_share.storage_share.resource_manager_id
}

output "url" {
  description = "The URL of the File Share."
  value       = azurerm_storage_share.storage_share.url
}