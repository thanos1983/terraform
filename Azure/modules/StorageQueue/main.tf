resource "azurerm_storage_queue" "storage_queue" {
  name                  = var.storage_account_queue_name
  storage_account_name  = var.storage_account_name
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