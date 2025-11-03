resource "azurerm_resource_group" "resource_group" {
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags

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
