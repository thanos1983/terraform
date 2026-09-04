resource "azurerm_network_security_rule" "network_security_rule" {
  name                                       = var.name
  resource_group_name                        = var.resource_group_name
  network_security_group_name                = var.network_security_group_name
  description                                = var.description
  protocol                                   = var.protocol
  source_port_range                          = var.source_port_range
  source_port_ranges                         = var.source_port_ranges
  destination_port_range                     = var.destination_port_range
  destination_port_ranges                    = var.destination_port_ranges
  source_address_prefix                      = var.source_address_prefix
  source_address_prefixes                    = var.source_address_prefixes
  source_application_security_group_ids      = var.source_application_security_group_ids
  destination_address_prefix                 = var.destination_address_prefix
  destination_address_prefixes               = var.destination_address_prefixes
  destination_application_security_group_ids = var.destination_application_security_group_ids
  access                                     = var.access
  priority                                   = var.priority
  direction                                  = var.direction

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