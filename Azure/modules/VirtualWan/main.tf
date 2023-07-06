resource "azurerm_virtual_wan" "virtual_wan" {
  name                              = var.name
  resource_group_name               = var.resources_group_name
  location                          = var.location
  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category
  type                              = var.type
  tags                              = var.tags

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