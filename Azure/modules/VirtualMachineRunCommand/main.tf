resource "azurerm_virtual_machine_run_command" "virtual_machine_run_command" {
  location           = var.location
  name               = var.name
  virtual_machine_id = var.virtual_machine_id

  dynamic "source" {
    for_each = var.source_block[*]
    content {
      command_id = source.value.command_id
      script     = source.value.script
      script_uri = source.value.script_uri
      dynamic "script_uri_managed_identity" {
        for_each = source.value.script_uri_managed_identity
        content {
          client_id = script_uri_managed_identity.value.client_id
          object_id = script_uri_managed_identity.value.object_id
        }
      }
    }
  }

  dynamic "error_blob_managed_identity" {
    for_each = var.error_blob_managed_identity_block[*]
    content {
      client_id = error_blob_managed_identity.value.client_id
      object_id = error_blob_managed_identity.value.object_id
    }
  }

  dynamic "output_blob_managed_identity" {
    for_each = var.output_blob_managed_identity_block[*]
    content {
      client_id = output_blob_managed_identity.value.client_id
      object_id = output_blob_managed_identity.value.object_id
    }
  }

  output_blob_uri = var.output_blob_uri

  dynamic "parameter" {
    for_each = var.parameter_blocks
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  dynamic "protected_parameter" {
    for_each = var.protected_parameter_blocks
    content {
      name  = protected_parameter.value.name
      value = protected_parameter.value.value
    }
  }

  run_as_password = var.run_as_password
  run_as_user     = var.run_as_user
  tags            = var.tags

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