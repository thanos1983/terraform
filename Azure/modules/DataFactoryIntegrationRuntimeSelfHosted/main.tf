resource "azurerm_data_factory_integration_runtime_self_hosted" "data_factory_integration_runtime_self_hosted" {
  data_factory_id = var.data_factory_id
  name            = var.name

  dynamic "rbac_authorization" {
    for_each = var.rbac_authorization_block[*]
    content {
      resource_id = rbac_authorization.value.resource_id
    }
  }

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
