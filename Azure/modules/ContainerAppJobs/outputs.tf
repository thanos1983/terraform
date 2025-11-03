output "id" {
  description = "The ID of the Container Registry."
  value       = azapi_resource.container_app_job.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azapi_resource.container_app_job.name
}

output "identity" {
  description = "An identity block as defined below, which contains the Managed Service Identity information for this azure resource."
  value       = azapi_resource.container_app_job.identity
}

output "output" {
  description = "The output json containing the properties specified in response_export_values."
  value       = jsondecode(azapi_resource.container_app_job.output)
}
