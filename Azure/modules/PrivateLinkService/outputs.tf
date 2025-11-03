output "id" {
  description = "The Private Link Service ID."
  value       = azurerm_private_link_service.private_link_service.id
}

output "name" {
  description = "The Private Link Service name."
  value       = azurerm_private_link_service.private_link_service.name
}

output "alias" {
  description = "A globally unique DNS Name for your Private Link Service."
  value       = azurerm_private_link_service.private_link_service.alias
}
