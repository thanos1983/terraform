resource "azurerm_dev_center_environment_type" "dev_center_environment_type" {
  name          = var.name
  dev_center_id = var.dev_center_id
  tags          = var.tags

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
