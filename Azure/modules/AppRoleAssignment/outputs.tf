output "principal_display_name" {
  description = "The display name of the principal to which the app role is assigned."
  value       = azuread_app_role_assignment.app_role_assignment.principal_display_name
}

output "principal_type" {
  description = "The object type of the principal to which the app role is assigned."
  value       = azuread_app_role_assignment.app_role_assignment.principal_type
}

output "resource_display_name" {
  description = "The display name of the application representing the resource."
  value       = azuread_app_role_assignment.app_role_assignment.resource_display_name
}
