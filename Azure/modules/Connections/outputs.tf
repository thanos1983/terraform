output "id" {
  description = "The ID of the Microsoft.Web connection(s)."
  value       = azapi_resource.connections.id
}

output "name" {
  description = "The name of the Microsoft.Web connection(s)."
  value       = azapi_resource.connections.name
}

output "output" {
  description = "The output json containing the properties specified in response_export_values."
  value       = jsondecode(azapi_resource.connections.output)
}
