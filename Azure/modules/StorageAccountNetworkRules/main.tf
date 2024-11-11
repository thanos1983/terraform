resource "azurerm_storage_account_network_rules" "storage_account_network_rules" {
  storage_account_id         = var.storage_account_id
  default_action             = var.default_action
  bypass                     = var.bypass
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.virtual_network_subnet_ids

  dynamic "private_link_access" {
    for_each = var.private_link_access_blocks
    content {
      endpoint_resource_id = private_link_access.value.endpoint_resource_id
      endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
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