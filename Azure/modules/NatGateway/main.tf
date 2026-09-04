resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  sku_name                = var.sku_name
  tags                    = var.tags
  zones                   = var.zones

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