output "id" {
  description = "The Role Assignment ID"
  value       = azurerm_role_assignment.role_assignment.id
}

output "name" {
  description = "The Role Assignment name."
  value       = azurerm_role_assignment.role_assignment.name
}

output "principal_type" {
  description = "The type of the principal_id, e.g. User, Group, Service Principal, Application, etc."
  value       = azurerm_role_assignment.role_assignment.principal_type
}
