output "key_id" {
  description = "A UUID used to uniquely identify this password credential."
  value       = azuread_application_password.application_password.key_id
}

output "value" {
  description = "The password for this application, which is generated by Azure Active Directory."
  value       = azuread_application_password.application_password.value
  sensitive   = true
}