output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_registry.container_registry.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azurerm_container_registry.container_registry.name
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.container_registry.login_server
}

output "admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.container_registry.admin_username
  sensitive   = true
}

output "admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.container_registry.admin_password
  sensitive   = true
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity.."
  value       = azurerm_container_registry.example.identity.0.principal_id
}

output "tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity."
  value       = azurerm_container_registry.example.identity.0.tenant_id
}