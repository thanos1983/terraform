resource "azurerm_virtual_machine_run_command" "virtual_machine_run_command" {
  location           = ""
  name               = var.name
  virtual_machine_id = var.virtual_machine_id

  source {}

  error_blob_managed_identity {}

  output_blob_managed_identity {}

  output_blob_uri = ""

  parameter {
    name  = ""
    value = ""
  }

  protected_parameter {
    name  = ""
    value = ""
  }

  run_as_password = ""
  run_as_user     = ""
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