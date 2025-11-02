output "id" {
  description = "The ID of the API Connection."
  value       = azurerm_api_connection.api_connection.id
}

output "logo_url" {
  description = "The Name of the API Connection."
  value       = azurerm_api_connection.api_connection.name
}
