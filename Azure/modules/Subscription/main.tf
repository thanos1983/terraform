resource "azurerm_subscription" "subscription" {
  subscription_name = var.subscription_name
  alias             = var.alias
  billing_scope_id  = var.billing_scope_id
  subscription_id   = var.subscription_id
  workload          = var.workload
  tags              = var.tags

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