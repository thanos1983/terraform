resource "azurerm_storage_share" "storage_share" {
  name                 = var.name
  storage_account_name = var.storage_account_name
  quota                = var.quota
  access_tier          = var.access_tier

  dynamic "acl" {
    for_each = var.acl_blocks
    content {
      id = acl.value.id
      dynamic "access_policy" {
        for_each = acl.value.access_policy[*]
        content {
          permissions = access_policy.value.permissions
          start       = access_policy.value.start
          expiry      = access_policy.value.expiry
        }
      }
    }
  }

  enabled_protocol = var.enabled_protocol
  metadata         = var.metadata

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