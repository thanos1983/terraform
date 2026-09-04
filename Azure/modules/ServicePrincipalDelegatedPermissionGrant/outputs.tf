output "id" {
  description = "The ID of the delegated permission grant."
  value       = azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grant.id
}
