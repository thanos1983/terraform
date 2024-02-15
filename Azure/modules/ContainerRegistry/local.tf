locals {}

data "azurerm_client_config" "current" {
  depends_on = [
    azurerm_container_registry.container_registry
  ]
}