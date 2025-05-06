output "id" {
  description = "The ID of the Arc Machine."
  value       = azurerm_arc_machine.arc_machine.id
}

output "name" {
  description = "The Name of the Arc Machine."
  value       = azurerm_arc_machine.arc_machine.name
}

output "identity" {
  description = "The identity of the Arc Machine."
  value       = azurerm_arc_machine.arc_machine.identity
}
