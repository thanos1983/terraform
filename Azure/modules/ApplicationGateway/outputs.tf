output "id" {
  description = "The ID of the Application Gateway."
  value       = azurerm_application_gateway.application_gateway.id
}

output "authentication_certificate" {
  description = "A list of authentication_certificate blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.authentication_certificate
}

output "backend_address_pool" {
  description = "A list of backend_address_pool blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.backend_address_pool
}

output "backend_http_settings" {
  description = "A list of backend_http_settings blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.backend_http_settings
}

output "frontend_ip_configuration" {
  description = "A list of frontend_ip_configuration blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.frontend_ip_configuration
}

output "frontend_port" {
  description = "A list of frontend_port blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.frontend_port
}

output "gateway_ip_configuration" {
  description = "A list of gateway_ip_configuration blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.gateway_ip_configuration
}

output "http_listener" {
  description = "A list of http_listener blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.http_listener
}

output "private_endpoint_connection" {
  description = "A list of private_endpoint_connection blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.private_endpoint_connection
}

output "private_link_configuration" {
  description = "A list of private_link_configuration blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.private_link_configuration
}

output "probe" {
  description = "A probe block as defined below."
  value       = azurerm_application_gateway.application_gateway.probe
}

output "request_routing_rule" {
  description = "A list of request_routing_rule blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.request_routing_rule
}

output "ssl_certificate" {
  description = "A list of ssl_certificate blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.ssl_certificate
}

output "url_path_map" {
  description = "A list of url_path_map blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.url_path_map
}

output "custom_error_configuration" {
  description = "A list of custom_error_configuration blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.custom_error_configuration
}

output "redirect_configuration" {
  description = "A list of redirect_configuration blocks as defined below."
  value       = azurerm_application_gateway.application_gateway.redirect_configuration
}
