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

output "identity" {
  description = "An identity block as defined below, which contains the Managed Service Identity information for this azure resource."
  value       = azurerm_container_app.container_app.identity
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = flatten([
    for identity in azurerm_container_app.container_app[*].identity : identity[*].principal_id
  ])
}

output "tenant_id" {
  description = "The Tenant ID associated with this Managed Service Identity."
  value       = flatten([
    for identity in azurerm_container_app.container_app[*].identity : identity[*].tenant_id
  ])
}

output "application_url" {
  description = "Extract the Portal Url."
  value       = azurerm_container_app.container_app.ingress[0].fqdn
}