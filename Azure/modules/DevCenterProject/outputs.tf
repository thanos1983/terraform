output "id" {
  description = "The ID of the Dev Center Project."
  value       = azurerm_dev_center_project.dev_center_project.id
}

output "name" {
  description = "The name of the Dev Center Project."
  value       = azurerm_dev_center_project.dev_center_project.name
}

output "fqdn" {
  description = "The URI of the Dev Center resource this project is associated with."
  value       = azurerm_dev_center_project.dev_center_project.dev_center_uri
}