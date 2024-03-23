locals {}

data "azuread_service_principal" "key_vault" {
  display_name = var.name
  depends_on   = [
    azurerm_key_vault.key_vault
  ]
}