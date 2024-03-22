locals {}

data "azuread_service_principal" "cognitive_account" {
  display_name = var.name
  depends_on   = [
    azurerm_linux_virtual_machine.linux_virtual_machine
  ]
}