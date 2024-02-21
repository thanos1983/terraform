output "id" {
  description = "The ID of the Storage Queue."
  value       = azurerm_storage_queue.storage_queue.id
}

output "name" {
  description = "The Name of the Storage Queue."
  value       = azurerm_storage_queue.storage_queue.name
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this Storage Queue."
  value       = azurerm_storage_queue.storage_queue.resource_manager_id
}