output "id" {
  description = "The ID of the Load Balancer Rule."
  value       = azurerm_lb_rule.lb_rule.id
}

output "name" {
  description = "The name of the Load Balancer Rule."
  value       = azurerm_lb_rule.lb_rule.name
}