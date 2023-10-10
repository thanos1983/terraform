output "id" {
  description = "The Resource ID of the Alias."
  value       = azurerm_subscription.subscription.id
}

output "subscription_name" {
  description = "The Subscription Name of the Alias."
  value       = azurerm_subscription.subscription.subscription_name
}

output "tenant_id" {
  description = "The ID of the Tenant to which the subscription belongs."
  value       = azurerm_subscription.subscription.tenant_id
}