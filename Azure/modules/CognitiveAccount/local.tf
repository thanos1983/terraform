locals {}

data "azuread_service_principal" "cognitive_account" {
  depends_on = [
    azurerm_cognitive_account.cognitive_account
  ]
}