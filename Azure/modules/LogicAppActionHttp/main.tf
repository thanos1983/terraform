resource "azurerm_logic_app_action_http" "logic_app_action_http" {
  name         = var.name
  logic_app_id = var.logic_app_id
  method       = var.method
  uri          = var.uri
  body         = var.body
  headers      = var.headers
  queries      = var.queries

  dynamic "run_after" {
    for_each = var.run_after_block[*]
    content {
      action_name   = run_after.value.action_name
      action_result = run_after.value.action_result
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
