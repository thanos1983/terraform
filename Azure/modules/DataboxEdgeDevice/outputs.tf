output "id" {
  description = "The ID of the Databox Edge Device."
  value       = azurerm_databox_edge_device.databox_edge_device.id
}

output "name" {
  description = "The Name of the Databox Edge Device."
  value       = azurerm_databox_edge_device.databox_edge_device.name
}

output "device_properties" {
  description = "A device_properties block as defined below."
  value       = azurerm_databox_edge_device.databox_edge_device.device_properties
}
