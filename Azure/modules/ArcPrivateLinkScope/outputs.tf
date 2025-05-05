output "id" {
  description = "The ID of the Azure Arc Private Link Scope."
  value       = azurerm_arc_private_link_scope.arc_private_link_scope.id
}

output "name" {
  description = "The Name of the Azure Arc Private Link Scope."
  value       = azurerm_arc_private_link_scope.arc_private_link_scope.name
}
