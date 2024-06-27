output "id" {
  description = "The ID of the Managed Disk."
  value       = azurerm_managed_disk.managed_disk.id
}

output "name" {
  description = "The Name of the Managed Disk."
  value       = azurerm_managed_disk.managed_disk.name
}