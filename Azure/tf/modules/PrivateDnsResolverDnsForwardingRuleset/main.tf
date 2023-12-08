resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "private_dns_resolver_dns_forwarding_ruleset" {
  name                                       = var.name
  resource_group_name                        = var.resource_group_name
  private_dns_resolver_outbound_endpoint_ids = var.private_dns_resolver_outbound_endpoint_ids
  location                                   = var.location
  tags                                       = var.tags

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