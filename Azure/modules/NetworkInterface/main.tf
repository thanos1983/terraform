resource "azurerm_network_interface" "network_interface" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  auxiliary_mode      = var.auxiliary_mode
  auxiliary_sku       = var.auxiliary_sku
  dns_servers         = var.dns_servers

  dynamic "ip_configuration" {
    for_each = var.ip_configuration_blocks
    content {
      name                                               = ip_configuration.value.name
      primary                                            = ip_configuration.value.primary
      subnet_id                                          = ip_configuration.value.subnet_id
      private_ip_address                                 = ip_configuration.value.private_ip_address
      public_ip_address_id                               = ip_configuration.value.public_ip_address_id
      private_ip_address_version                         = ip_configuration.value.private_ip_address_version
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address_allocation
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
    }
  }

  edge_zone                      = var.edge_zone
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled
  internal_dns_name_label        = var.internal_dns_name_label
  tags                           = var.tags

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