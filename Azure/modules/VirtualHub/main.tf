resource "azurerm_virtual_hub" "virtual_hub" {
  name                   = var.name
  resource_group_name    = var.resources_group_name
  location               = var.location
  address_prefix         = var.address_prefix
  hub_routing_preference = var.hub_routing_preference

  dynamic "route" {
    for_each = var.route_block[*]
    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }

  sku            = var.sku
  virtual_wan_id = var.virtual_wan_id

  tags = var.tags

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
