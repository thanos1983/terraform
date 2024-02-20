locals {}

data "azurerm_client_config" "current" {
  depends_on = [
    azurerm_cognitive_account.cognitive_account
  ]
}