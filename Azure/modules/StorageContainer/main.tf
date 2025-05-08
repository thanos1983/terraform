resource "azurerm_storage_container" "storage_container" {
  name                  = var.name
  storage_account_id    = var.storage_account_id
  container_access_type = var.container_access_type
  metadata              = var.metadata

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