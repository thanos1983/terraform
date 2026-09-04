resource "azuread_service_principal_delegated_permission_grant" "service_principal_delegated_permission_grant" {
  claim_values                         = var.claim_values
  resource_service_principal_object_id = var.resource_service_principal_object_id
  service_principal_object_id          = var.service_principal_object_id
  user_object_id                       = var.user_object_id

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
