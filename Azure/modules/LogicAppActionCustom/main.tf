resource "azurerm_logic_app_action_custom" "logic_app_action_custom" {
  name         = var.name
  logic_app_id = var.logic_app_id
  body         = var.body

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
