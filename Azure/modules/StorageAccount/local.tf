locals {}

data "azuread_service_principal" "storage_account" {
  display_name = var.name
  depends_on   = [
    azurerm_storage_account.storage_account
  ]
}