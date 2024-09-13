resource "azurerm_dev_center_project" "dev_center_project" {
  dev_center_id              = var.dev_center_id
  location                   = var.location
  name                       = var.name
  resource_group_name        = var.resource_group_name
  description                = var.description
  maximum_dev_boxes_per_user = var.maximum_dev_boxes_per_user
  tags                       = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}