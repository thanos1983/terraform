resource "azurerm_dns_zone" "dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "soa_record" {
    for_each = var.soa_record_block[*]
    content {
      email         = soa_record.value.email
      host_name     = soa_record.value.host_name
      expire_time   = soa_record.value.expire_time
      minimum_ttl   = soa_record.value.minimum_ttl
      refresh_time  = soa_record.value.refresh_time
      retry_time    = soa_record.value.retry_time
      serial_number = soa_record.value.serial_number
      ttl           = soa_record.value.ttl
      tags          = soa_record.value.tags
    }
  }

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
