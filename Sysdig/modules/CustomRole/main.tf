resource "sysdig_custom_role" "custom_role" {
  name        = var.name
  description = var.description

  dynamic "permissions" {
    for_each = var.permissions_block[*]
    content {
      monitor_permissions = permissions.value.monitor_permissions
      secure_permissions  = permissions.value.secure_permissions
    }
  }
}
