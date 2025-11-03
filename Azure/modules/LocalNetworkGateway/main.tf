resource "azurerm_local_network_gateway" "local_network_gateway" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  dynamic "bgp_settings" {
    for_each = var.bgp_settings_block[*]
    content {
      asn                 = bgp_settings.value.asn
      peer_weight         = bgp_settings.value.peer_weight
      bgp_peering_address = bgp_settings.value.bgp_peering_address
    }
  }

  gateway_address = var.gateway_address
  gateway_fqdn    = var.gateway_fqdn
  tags            = var.tags

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
