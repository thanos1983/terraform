output "id" {
  description = "The ID of the Deployment for Azure Cognitive Services Account."
  value       = azurerm_cognitive_deployment.cognitive_deployment.id
}

output "name" {
  description = "The Name of the Deployment for Azure Cognitive Services Account."
  value       = azurerm_cognitive_deployment.cognitive_deployment.name
}