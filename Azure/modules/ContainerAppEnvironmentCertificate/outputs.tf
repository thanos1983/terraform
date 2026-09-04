output "id" {
  description = "The ID of the Container App Environment Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.id
}

output "name" {
  description = "The Name of the Container App Environment Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.name
}

output "expiration_date" {
  description = "The expiration date for the Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.expiration_date
}

output "issue_date" {
  description = "The date of issue for the Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.issue_date
}

output "issuer" {
  description = "The Certificate Issuer."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.issuer
}

output "subject_name" {
  description = "The Subject Name for the Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.subject_name
}

output "thumbprint" {
  description = "The Thumbprint of the Certificate."
  value       = azurerm_container_app_environment_certificate.container_app_environment_certificate.thumbprint
}