locals {}

data "azuread_service_principal" "storage_account" {
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}