locals {}

data "azuread_service_principal" "cognitive_account" {
  display_name = var.name
  depends_on   = [
    azurerm_windows_virtual_machine.windows_virtual_machine
  ]
}