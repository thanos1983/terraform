output "id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.storage_container.id
}

output "name" {
  description = "The name of the Storage Container."
  value       = azurerm_storage_container.storage_container.name
}

output "has_immutability_policy" {
  description = "Is there an Immutability Policy configured on this Storage Container?"
  value       = azurerm_storage_container.storage_container.has_immutability_policy
}

output "has_legal_hold" {
  description = "Is there a Legal Hold configured on this Storage Container?"
  value       = azurerm_storage_container.storage_container.has_legal_hold
}
