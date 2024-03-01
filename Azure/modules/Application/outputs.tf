output "app_role_ids" {
  description = "A mapping of app role values to app role IDs, intended to be useful when referencing app roles in other resources in your configuration."
  value       = azuread_application.application.app_role_ids
}

output "client_id" {
  description = "The Client ID for the application."
  value       = azuread_application.application.client_id
}

output "disabled_by_microsoft" {
  description = "Whether Microsoft has disabled the registered application. If the application is disabled, this will be a string indicating the status/reason, e.g. DisabledDueToViolationOfServicesAgreement"
  value       = azuread_application.application.disabled_by_microsoft
}

output "id" {
  description = "The Terraform resource ID for the application, for use when referencing this resource in your Terraform configuration."
  value       = azuread_application.application.id
}

output "logo_url" {
  description = "CDN URL to the application's logo, as uploaded with the logo_image property."
  value       = azuread_application.application.logo_url
}

output "oauth2_permission_scope_ids" {
  description = "A mapping of OAuth2.0 permission scope values to scope IDs, intended to be useful when referencing permission scopes in other resources in your configuration."
  value       = azuread_application.application.oauth2_permission_scope_ids
}

output "object_id" {
  description = "The application's object ID."
  value       = azuread_application.application.object_id
}

output "publisher_domain" {
  description = "The verified publisher domain for the application."
  value       = azuread_application.application.publisher_domain
}