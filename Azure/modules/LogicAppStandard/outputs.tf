output "id" {
  description = "The ID of the Logic App."
  value       = azurerm_logic_app_standard.logic_app_standard.id
}

output "name" {
  description = "The name of the Logic App."
  value       = azurerm_logic_app_standard.logic_app_standard.name
}

output "custom_domain_verification_id" {
  description = "An identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_logic_app_standard.logic_app_standard.custom_domain_verification_id
}

output "default_hostname" {
  description = "The default hostname associated with the Logic App - such as mysite.azurewebsites.net"
  value       = azurerm_logic_app_standard.logic_app_standard.default_hostname
}

output "outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12"
  value       = azurerm_logic_app_standard.logic_app_standard.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use."
  value       = azurerm_logic_app_standard.logic_app_standard.possible_outbound_ip_addresses
}

output "identity" {
  description = "An identity block as defined below, which contains the Managed Service Identity information for this App Service."
  value       = azurerm_logic_app_standard.logic_app_standard.identity
}

output "site_credential" {
  description = "A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service."
  value       = azurerm_logic_app_standard.logic_app_standard.site_credential
}

output "kind" {
  description = "The Logic App kind - will be functionapp,workflowapp."
  value       = azurerm_logic_app_standard.logic_app_standard.kind
}