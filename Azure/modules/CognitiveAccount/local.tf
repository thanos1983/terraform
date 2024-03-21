locals {}

data "azuread_service_principal" "cognitive_account" {
  display_name = var.name
  depends_on   = [
    azurerm_cognitive_account.cognitive_account
  ]
}