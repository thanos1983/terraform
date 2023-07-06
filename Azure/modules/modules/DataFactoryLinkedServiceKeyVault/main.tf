resource "azurerm_data_factory_linked_service_key_vault" "data_factory_linked_service_key_vault" {
  name                     = var.name
  data_factory_id          = var.data_factory_id
  key_vault_id             = var.key_vault_id
  description              = var.description
  integration_runtime_name = var.integration_runtime_name
  annotations              = var.annotations
  parameters               = var.parameters
  additional_properties    = var.additional_properties

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
