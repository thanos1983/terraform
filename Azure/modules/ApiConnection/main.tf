resource "azurerm_api_connection" "api_connection" {
  managed_api_id      = var.managed_api_id
  name                = var.name
  resource_group_name = var.resource_group_name
  display_name        = var.display_name
  parameter_values    = var.parameter_values
  tags                = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
