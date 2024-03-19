resource "azurerm_logic_app_trigger_custom" "logic_app_trigger_custom" {
  name         = var.name
  logic_app_id = var.logic_app_id
  body         = var.body
}