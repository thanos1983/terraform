resource "azurerm_private_dns_resolver_virtual_network_link" "private_dns_resolver_virtual_network_link" {
  name                      = var.name
  dns_forwarding_ruleset_id = var.dns_forwarding_ruleset_id
  virtual_network_id        = var.virtual_network_id
  metadata                  = var.metadata

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