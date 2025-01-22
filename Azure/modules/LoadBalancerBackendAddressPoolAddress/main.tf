resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_pool_address" {
  backend_address_pool_id             = var.backend_address_pool_id
  ip_address                          = var.ip_address
  name                                = var.name
  virtual_network_id                  = var.virtual_network_id
  backend_address_ip_configuration_id = var.backend_address_ip_configuration_id

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