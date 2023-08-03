resource "azurerm_private_dns_resolver_forwarding_rule" "private_dns_resolver_forwarding_rule" {
  name                      = var.name
  dns_forwarding_ruleset_id = var.dns_forwarding_ruleset_id
  domain_name               = var.domain_name

  dynamic "target_dns_servers" {
    for_each = var.target_dns_servers_block
    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }
  
  enabled            = var.enabled
  metadata           = var.metadata

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