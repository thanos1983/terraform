output "id" {
  description = "The ID of the Availability Set."
  value       = azurerm_availability_set.availability_set.id
}

output "name" {
  description = "The name of the Availability Set."
  value       = azurerm_availability_set.availability_set.name
}
