resource "azurerm_logic_app_trigger_http_request" "logic_app_trigger_http_request" {
  name          = var.name
  logic_app_id  = var.logic_app_id
  schema        = var.schema
  method        = var.method
  relative_path = var.relative_path
}