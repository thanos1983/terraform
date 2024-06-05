resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}