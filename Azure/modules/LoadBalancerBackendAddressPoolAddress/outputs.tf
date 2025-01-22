output "id" {
  description = "The ID of the Backend Address Pool Address."
  value       = azurerm_lb_backend_address_pool_address.lb_backend_address_pool_address.id
}

output "name" {
  description = "The name of the Backend Address Pool Address."
  value       = azurerm_lb_backend_address_pool_address.lb_backend_address_pool_address.name
}

output "inbound_nat_rule_port_mapping" {
  description = "A list of inbound_nat_rule_port_mapping block as defined below."
  value       = azurerm_lb_backend_address_pool_address.lb_backend_address_pool_address.inbound_nat_rule_port_mapping
}
