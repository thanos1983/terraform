resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "soa_record" {
    for_each = var.soa_record_block[*]
    content {
      email        = soa_record.value.email
      expire_time  = soa_record.value.expire_time
      minimum_ttl  = soa_record.value.minimum_ttl
      refresh_time = soa_record.value.refresh_time
      retry_time   = soa_record.value.retry_time
      ttl          = soa_record.value.ttl
      tags         = soa_record.value.tags
    }
  }

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

module "private_dns_zone_virtual_network_link" {
  source                = "../PrivateDnsZoneVirtualNetworkLink"
  count                 = var.virtual_network_link_name == null ? 0 : 1
  tags                  = var.tags
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name
  registration_enabled  = var.registration_enabled
  name                  = var.virtual_network_link_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
}

module "private_dns_a_record" {
  source              = "../PrivateDnsARecord"
  count               = var.private_dns_a_records == null ? 0 : length(var.private_dns_a_records)
  tags                = var.tags
  resource_group_name = var.resource_group_name
  ttl                 = var.private_dns_a_records[count.index].ttl
  name                = var.private_dns_a_records[count.index].name
  records             = var.private_dns_a_records[count.index].records
  zone_name           = azurerm_private_dns_zone.private_dns_zone.name
}
