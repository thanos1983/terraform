output "id" {
  description = "The Load Balancer ID."
  value       = azurerm_lb.load_balancer.id
}

output "frontend_ip_configuration" {
  description = "A frontend_ip_configuration block."
  value       = azurerm_lb.load_balancer.frontend_ip_configuration
}

output "private_ip_address" {
  description = "The first private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
  value       = azurerm_lb.load_balancer.private_ip_address
}

output "private_ip_addresses" {
  description = "The list of private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
  value       = azurerm_lb.load_balancer.private_ip_addresses
}