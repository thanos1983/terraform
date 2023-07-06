resource "azurerm_data_factory_linked_service_sql_server" "data_factory_linked_service_sql_server" {
  name                     = var.name
  data_factory_id          = var.data_factory_id
  connection_string        = var.connection_string
  description              = var.description
  integration_runtime_name = var.integration_runtime_name
  annotations              = var.annotations
  parameters               = var.parameters
  additional_properties    = var.additional_properties

  dynamic "key_vault_connection_string" {
    for_each = var.key_vault_connection_string_block[*]
    content {
      linked_service_name = key_vault_connection_string.value.linked_service_name
      secret_name         = key_vault_connection_string.value.secret_name
    }
  }

  dynamic "key_vault_password" {
    for_each = var.key_vault_password_block[*]
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }

  user_name = var.user_name

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
