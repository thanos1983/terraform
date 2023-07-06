output "id" {
  description = "The Key Vault Access Policy ID."
  value       = azurerm_key_vault_access_policy.key_vault_access_policy[*].id
}