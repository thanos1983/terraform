resource "azurerm_role_definition" "role_definition" {
  role_definition_id = var.role_definition_id
  name               = var.name
  scope              = var.scope
  description        = var.description

  dynamic "permissions" {
    for_each = var.permissions_block[*]
    content {
      actions          = permissions.value.actions
      data_actions     = permissions.value.data_actions
      not_actions      = permissions.value.not_actions
      not_data_actions = permissions.value.not_data_actions
    }
  }

  assignable_scopes = var.assignable_scopes

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
