locals {}

data "azurerm_client_config" "current" {
  depends_on = [
    azuread_application_password.application_password
  ]
}
