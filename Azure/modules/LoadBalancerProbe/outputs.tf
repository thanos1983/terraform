output "id" {
  description = "The ID of the Load Balancer Probe."
  value       = azurerm_lb_probe.lb_probe.id
}

output "name" {
  description = "The name of the Load Balancer Probe."
  value       = azurerm_lb_probe.lb_probe.name
}