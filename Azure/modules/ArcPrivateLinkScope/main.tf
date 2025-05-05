resource "azurerm_arc_private_link_scope" "arc_private_link_scope" {
  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

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
