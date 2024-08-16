resource "azuread_group_member" "group_member" {
  group_object_id  = var.group_object_id
  member_object_id = var.member_object_id

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}