output "id" {
  description = "The id of the virtual HUB."
  value       = azurerm_virtual_hub.virtual_hub.id
}

output "name" {
  description = "The name of the virtual HUB."
  value       = azurerm_virtual_hub.virtual_hub.name
}

output "default_route_table_id" {
  description = "The ID of the default Route Table in the Virtual Hub."
  value       = azurerm_virtual_hub.virtual_hub.default_route_table_id
}

output "virtual_router_asn" {
  description = "The Autonomous System Number of the Virtual Hub BGP router."
  value       = azurerm_virtual_hub.virtual_hub.virtual_router_asn
}

output "virtual_router_ips" {
  description = "The IP addresses of the Virtual Hub BGP router."
  value       = azurerm_virtual_hub.virtual_hub.virtual_router_ips
}