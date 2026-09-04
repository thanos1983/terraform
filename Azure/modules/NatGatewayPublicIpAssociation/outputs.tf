output "id" {
  description = "The (Terraform specific) ID of the Association between the NAT Gateway and the Public IP."
  value       = azurerm_nat_gateway_public_ip_association.nat_gateway_public_ip_association.id
}