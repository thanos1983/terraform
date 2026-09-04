output "id" {
  description = "The ID of the Container Registry."
  value       = azapi_update_resource.update_resource.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azapi_update_resource.update_resource.name
}

output "output" {
  description = "The output json containing the properties specified in response_export_values."
  value       = jsondecode(azapi_update_resource.update_resource.output)
}