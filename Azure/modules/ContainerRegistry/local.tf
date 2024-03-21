locals {}

data "azuread_service_principal" "container_registry" {
  depends_on = [
    azurerm_container_registry.container_registry
  ]
}