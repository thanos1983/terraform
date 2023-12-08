output "id" {
  description = "The Key Vault Secret ID."
  value       = azurerm_key_vault_secret.key_vault_secret.id
}

output "name" {
  description = "The Key Vault Secret Name."
  value       = azurerm_key_vault_secret.key_vault_secret.name
}

output "version" {
  description = "The current version of the Key Vault Secret."
  value       = azurerm_key_vault_secret.key_vault_secret.version
}

output "versionless_id" {
  description = "The Base ID of the Key Vault Secret."
  value       = azurerm_key_vault_secret.key_vault_secret.versionless_id
}