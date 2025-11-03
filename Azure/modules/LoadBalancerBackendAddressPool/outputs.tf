output "id" {
  description = "The ID of the Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.id
}

output "backend_ip_configurations" {
  description = "The Backend IP Configurations associated with this Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.backend_ip_configurations
}

output "load_balancing_rules" {
  description = "The Load Balancing Rules associated with this Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.load_balancing_rules
}

output "inbound_nat_rules" {
  description = "An array of the Load Balancing Inbound NAT Rules associated with this Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.inbound_nat_rules
}

output "outbound_rules" {
  description = "An array of the Load Balancing Outbound Rules associated with this Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.outbound_rules
}
