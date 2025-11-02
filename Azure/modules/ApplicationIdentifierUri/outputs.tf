output "identifier_uri" {
  description = "The user-defined URI that uniquely identifies an application within its Azure AD tenant."
  value       = azuread_application_identifier_uri.identifier_uri.identifier_uri
}
