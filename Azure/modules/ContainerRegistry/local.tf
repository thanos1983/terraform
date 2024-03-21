locals {}

data "azuread_service_principal" "container_registry" {
  display_name = var.name
  depends_on   = [
    azurerm_container_registry.container_registry
  ]
}