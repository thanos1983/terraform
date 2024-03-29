output "app_role_ids" {
  description = "A mapping of app role values to app role IDs, as published by the associated application, intended to be useful when referencing app roles in other resources in your configuration."
  value       = azuread_service_principal.service_principal.app_role_ids
}

output "app_roles" {
  description = "A list of app roles published by the associated application."
  value       = azuread_service_principal.service_principal.app_roles
}

output "application_tenant_id" {
  description = "The tenant ID where the associated application is registered."
  value       = azuread_service_principal.service_principal.application_tenant_id
}

output "display_name" {
  description = "The display name of the application associated with this service principal."
  value       = azuread_service_principal.service_principal.display_name
}

output "homepage_url" {
  description = "Home page or landing page of the associated application."
  value = azuread_service_principal.service_principal.homepage_url
}

output "logout_url" {
  description = "The URL that will be used by Microsoft's authorization service to log out an user using OpenId Connect front-channel, back-channel or SAML logout protocols, taken from the associated application."
  value = azuread_service_principal.service_principal.logout_url
}

output "oauth2_permission_scope_ids" {
  description = "A mapping of OAuth2.0 permission scope values to scope IDs, as exposed by the associated application, intended to be useful when referencing permission scopes in other resources in your configuration."
  value = azuread_service_principal.service_principal.oauth2_permission_scope_ids
}

output "oauth2_permission_scopes" {
  description = "A list of OAuth 2.0 delegated permission scopes exposed by the associated application, as documented below."
  value = azuread_service_principal.service_principal.oauth2_permission_scopes
}

output "object_id" {
  description = "The object ID of the service principal."
  value = azuread_service_principal.service_principal.object_id
}

output "redirect_uris" {
  description = "A list of URLs where user tokens are sent for sign-in with the associated application, or the redirect URIs where OAuth 2.0 authorization codes and access tokens are sent for the associated application."
  value = azuread_service_principal.service_principal.redirect_uris
}

output "saml_metadata_url" {
  description = "The URL where the service exposes SAML metadata for federation."
  value = azuread_service_principal.service_principal.saml_metadata_url
}

output "service_principal_names" {
  description = "A list of identifier URI(s), copied over from the associated application."
  value = azuread_service_principal.service_principal.service_principal_names
}

output "sign_in_audience" {
  description = "The Microsoft account types that are supported for the associated application."
  value = azuread_service_principal.service_principal.sign_in_audience
}

output "type" {
  description = "Identifies whether the service principal represents an application or a managed identity."
  value = azuread_service_principal.service_principal.type
}