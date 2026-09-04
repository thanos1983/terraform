resource "azuread_app_role_assignment" "app_role_assignment" {
  app_role_id         = var.app_role_id
  principal_object_id = var.principal_object_id
  resource_object_id  = var.resource_object_id

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
