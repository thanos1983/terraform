output "id" {
  description = "The ID of the Cognitive Service Account."
  value       = azurerm_cognitive_account.cognitive_account.id
}

output "name" {
  description = "The Name of the Cognitive Service Account."
  value       = azurerm_cognitive_account.cognitive_account.name
}

output "endpoint" {
  description = "The endpoint used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.cognitive_account.endpoint
}

output "identity" {
  description = "An identity block as defined below."
  value       = azurerm_cognitive_account.cognitive_account.identity
}

output "primary_access_key" {
  description = "A primary access key which can be used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.cognitive_account.primary_access_key
  sensitive   = true
}

output "second_access_key" {
  description = "The secondary access key which can be used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.cognitive_account.secondary_access_key
  sensitive   = true
}
