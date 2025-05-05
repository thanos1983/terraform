output "id" {
  description = "The ID of the Hybrid Compute Machine Extension."
  value       = azurerm_arc_machine_extension.arc_machine_extension.id
}

output "name" {
  description = "The Name of the Hybrid Compute Machine Extension."
  value       = azurerm_arc_machine_extension.arc_machine_extension.name
}
