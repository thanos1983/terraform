output "id" {
  description = "The (Terraform specific) ID of the Association between the Network Interface and the Network Interface."
  value       = azurerm_network_interface_security_group_association.network_interface_security_group_association.id
}