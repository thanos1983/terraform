resource "azurerm_dns_cname_record" "dns_cname_record" {
  name                = var.name
  resource_group_name = var.resource_group_name
  zone_name           = var.zone_name
  ttl                 = var.ttl
  record              = var.record
  target_resource_id  = var.target_resource_id
  tags                = var.tags

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
