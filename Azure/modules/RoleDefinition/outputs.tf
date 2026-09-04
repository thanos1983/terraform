output "id" {
  description = "This ID is specific to Terraform."
  value       = azurerm_role_definition.role_definition.id
}

output "role_definition_id" {
  description = "The Role Definition ID. Changing this forces a new resource to be created."
  value       = azurerm_role_definition.role_definition.role_definition_id
}

output "role_definition_resource_id" {
  description = "The Azure Resource Manager ID for the resource."
  value       = azurerm_role_definition.role_definition.role_definition_resource_id
}