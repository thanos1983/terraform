locals {}

data "azurerm_client_config" "current" {
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}