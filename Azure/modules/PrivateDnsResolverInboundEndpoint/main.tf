resource "azurerm_private_dns_resolver_inbound_endpoint" "private_dns_resolver_inbound_endpoint" {
  name                    = var.name
  private_dns_resolver_id = var.private_dns_resolver_id

  dynamic "ip_configurations" {
    for_each = var.ip_configurations_block
    content {
      private_ip_allocation_method = ip_configurations.value.private_ip_allocation_method
      subnet_id                    = ip_configurations.value.subnet_id
    }
  }

  location = var.location
  tags     = var.tags

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
