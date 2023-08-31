output "id" {
  description = "The ID of this Public IP."
  value       = azurerm_public_ip.public_ip[*].id
}

output "name" {
  description = "The name of this Public IP."
  value       = azurerm_public_ip.public_ip[*].name
}

output "ip_address" {
  description = "The IP address value that was allocated."
  value       = azurerm_public_ip.public_ip[*].ip_address
}

output "fqdn" {
  description = "Fully qualified domain name of the A DNS record associated with the public IP."
  value       = azurerm_public_ip.public_ip[*].fqdn
}

output "domain_name_label" {
  description = "The label for the Domain Name."
  value       = azurerm_public_ip.public_ip[*].domain_name_label
}

output "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection."
  value       = azurerm_public_ip.public_ip[*].idle_timeout_in_minutes
}

output "ddos_protection_mode" {
  description = "The DDoS protection mode of the public IP."
  value       = azurerm_public_ip.public_ip[*].ddos_protection_mode
}

output "ddos_protection_plan_id" {
  description = "The ID of DDoS protection plan associated with the public IP."
  value       = azurerm_public_ip.public_ip[*].ddos_protection_plan_id
}

output "ip_version" {
  description = "The IP version being used, for example IPv4 or IPv6."
  value       = azurerm_public_ip.public_ip[*].ip_version
}

output "sku" {
  description = "The SKU of the Public IP."
  value       = azurerm_public_ip.public_ip[*].sku
}

output "ip_tags" {
  description = "A mapping of tags to assigned to the IP resource."
  value       = azurerm_public_ip.public_ip[*].ip_tags
}

output "tags" {
  description = "A mapping of tags assigned to the resource."
  value       = azurerm_public_ip.public_ip[*].tags
}

output "zones" {
  description = "A list of Availability Zones in which this Public IP is located."
  value       = azurerm_public_ip.public_ip[*].zones
}