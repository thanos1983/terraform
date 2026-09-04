output "id" {
  description = "The (Terraform specific) ID of the Association between the Network Interface and the Network Interface."
  value       = azurerm_subnet_network_security_group_association.subnet_network_security_group_association.id
}