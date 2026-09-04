resource "azuread_application_owner" "application_owner" {
  application_id  = var.application_id
  owner_object_id = var.owner_object_id

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
