output "id" {
  description = "The Load Balancer ID."
  value       = azurerm_lb.lb.id
}

output "frontend_ip_configuration" {
  description = "A frontend_ip_configuration block."
  value       = azurerm_lb.lb.frontend_ip_configuration
}

output "private_ip_address" {
  description = "The first private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
  value       = azurerm_lb.lb.private_ip_address
}

output "private_ip_addresses" {
  description = "The list of private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
  value       = azurerm_lb.lb.private_ip_addresses
}