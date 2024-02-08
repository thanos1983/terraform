output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_app.container_app.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azurerm_container_app.container_app.name
}

output "custom_domain_verification_id" {
  description = "The ID of the Custom Domain Verification for this Container App."
  value       = azurerm_container_app.container_app.custom_domain_verification_id
}

output "latest_revision_fqdn" {
  description = "The FQDN of the Latest Revision of the Container App."
  value       = azurerm_container_app.container_app.latest_revision_fqdn
}

output "latest_revision_name" {
  description = "The name of the latest Container Revision."
  value       = azurerm_container_app.container_app.latest_revision_name
}

output "location" {
  description = "The location this Container App is deployed in."
  value       = azurerm_container_app.container_app.location
}

output "outbound_ip_addresses" {
  description = "A list of the Public IP Addresses which the Container App uses for outbound network access."
  value       = azurerm_container_app.container_app.outbound_ip_addresses
}

output "principal_id" {
  value = azurerm_container_app.container_app.identity.0.principal_id
}