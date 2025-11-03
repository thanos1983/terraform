resource "azurerm_dev_center_gallery" "dev_center_gallery" {
  dev_center_id     = var.dev_center_id
  shared_gallery_id = var.shared_gallery_id
  name              = var.name

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
