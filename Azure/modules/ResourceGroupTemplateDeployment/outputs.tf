output "id" {
  description = "The ID of the Resource Group Template Deployment."
  value       = azurerm_resource_group_template_deployment.resource_group_template_deployment.id
}

output "name" {
  description = "The Name of the Resource Group Template Deployment."
  value       = azurerm_resource_group_template_deployment.resource_group_template_deployment.name
}

output "output_content" {
  description = "The JSON Content of the Outputs of the ARM Template Deployment."
  value       = azurerm_resource_group_template_deployment.resource_group_template_deployment.output_content
}
