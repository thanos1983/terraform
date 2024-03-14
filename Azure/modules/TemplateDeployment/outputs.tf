output "id" {
  description = "The Template Deployment ID."
  value       = azurerm_template_deployment.template_deployment.id
}

output "name" {
  description = "The Template Deployment Name."
  value       = azurerm_template_deployment.template_deployment.name
}

output "outputs" {
  description = "A map of supported scalar output types returned from the deployment (currently, Azure Template Deployment outputs of type String, Int and Bool are supported, and are converted to strings - others will be ignored) and can be accessed using .outputs[\"name\"]."
  value       = azurerm_template_deployment.template_deployment.outputs
}