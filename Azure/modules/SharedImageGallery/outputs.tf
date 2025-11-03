output "id" {
  description = "The ID of the Shared Image Gallery."
  value       = azurerm_shared_image_gallery.shared_image_gallery.id
}

output "name" {
  description = "The name of the Shared Image Gallery."
  value       = azurerm_shared_image_gallery.shared_image_gallery.name
}

output "unique_name" {
  description = "The Unique Name for this Shared Image Gallery."
  value       = azurerm_shared_image_gallery.shared_image_gallery.unique_name
}
