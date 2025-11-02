output "client_id" {
  description = "The Client ID for the application."
  value       = azuread_application_registration.application_registration.client_id
}

output "disabled_by_microsoft" {
  description = "Whether Microsoft has disabled the registered application. If the application is disabled, this will be a string indicating the status/reason, e.g. DisabledDueToViolationOfServicesAgreement"
  value       = azuread_application_registration.application_registration.disabled_by_microsoft
}

output "id" {
  description = "The Terraform resource ID for the application, for use when referencing this resource in your Terraform configuration."
  value       = azuread_application_registration.application_registration.id
}

output "object_id" {
  description = "The application's object ID."
  value       = azuread_application_registration.application_registration.object_id
}

output "publisher_domain" {
  description = "The verified publisher domain for the application."
  value       = azuread_application_registration.application_registration.publisher_domain
}
