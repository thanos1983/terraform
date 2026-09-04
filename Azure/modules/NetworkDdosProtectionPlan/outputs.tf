output "id" {
  description = "The ID of the DDoS Protection Plan."
  value       = azurerm_network_ddos_protection_plan.network_ddos_protection_plan.id
}

output "name" {
  description = "The name of the DDoS Protection Plan."
  value       = azurerm_network_ddos_protection_plan.network_ddos_protection_plan.name
}

output "virtual_network_ids" {
  description = "A list of Virtual Network IDs associated with the DDoS Protection Plan."
  value       = azurerm_network_ddos_protection_plan.network_ddos_protection_plan.virtual_network_ids
}