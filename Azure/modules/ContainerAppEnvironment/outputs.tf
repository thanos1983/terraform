output "id" {
  description = "The ID of the Container App Environment."
  value       = azurerm_container_app_environment.container_app_environment.id
}

output "name" {
  description = "The name of the Container App Environment."
  value       = azurerm_container_app_environment.container_app_environment.name
}

output "default_domain" {
  description = "The default, publicly resolvable, name of this Container App Environment."
  value       = azurerm_container_app_environment.container_app_environment.default_domain
}

output "docker_bridge_cidr" {
  description = "The network addressing in which the Container Apps in this Container App Environment will reside in CIDR notation."
  value       = azurerm_container_app_environment.container_app_environment.docker_bridge_cidr
}

output "platform_reserved_cidr" {
  description = "The IP range, in CIDR notation, that is reserved for environment infrastructure IP addresses."
  value       = azurerm_container_app_environment.container_app_environment.platform_reserved_cidr
}

output "platform_reserved_dns_ip_address" {
  description = "The IP address from the IP range defined by platform_reserved_cidr that is reserved for the internal DNS server."
  value       = azurerm_container_app_environment.container_app_environment.platform_reserved_dns_ip_address
}

output "static_ip_address" {
  description = "The Static IP address of the Environment."
  value       = azurerm_container_app_environment.container_app_environment.static_ip_address
}