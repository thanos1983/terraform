resource "azurerm_network_interface_backend_address_pool_association" "network_interface_backend_address_pool_association" {
  network_interface_id    = var.network_interface_id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = var.backend_address_pool_id

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}