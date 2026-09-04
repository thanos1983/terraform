resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  name             = var.name
  loadbalancer_id  = var.loadbalancer_id
  synchronous_mode = var.synchronous_mode

  dynamic "tunnel_interface" {
    for_each = var.tunnel_interface_blocks
    content {
      identifier = tunnel_interface.value.identifier
      type       = tunnel_interface.value.type
      protocol   = tunnel_interface.value.protocol
      port       = tunnel_interface.value.port
    }
  }

  virtual_network_id = var.virtual_network_id

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