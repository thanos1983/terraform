resource "azurerm_container_app_environment_dapr_component" "container_app_environment_dapr_component" {
  container_app_environment_id = var.container_app_environment_id
  name                         = var.name
  component_type               = var.component_type
  version                      = var.dapr_component_version
  ignore_errors                = var.ignore_errors
  init_timeout                 = var.init_timeout

  dynamic "metadata" {
    for_each = var.metadata_blocks
    content {
      name        = metadata.value.name
      secret_name = metadata.value.secret_name
      value       = metadata.value.value
    }
  }

  scopes = var.scopes

  dynamic "secret" {
    for_each = var.secret_block[*]
    content {
      name  = secret.value.name
      value = secret.value.value
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
