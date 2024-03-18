output "id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.service_plan.id
}

output "name" {
  description = "The Name of the Service Plan."
  value       = azurerm_service_plan.service_plan.name
}

output "kind" {
  description = "The Kind of the Service Plan."
  value       = azurerm_service_plan.service_plan.kind
}

output "reserved" {
  description = "Whether this is a reserved Service Plan Type. true if os_type is Linux, otherwise false."
  value       = azurerm_service_plan.service_plan.reserved
}