resource "sysdig_secure_team" "secure_team" {
  name               = var.name
  description        = var.description
  theme              = var.theme
  scope_by           = var.scope_by
  filter             = var.filter
  use_sysdig_capture = var.use_sysdig_capture
  default_team       = var.default_team

  dynamic "user_roles" {
    for_each = var.user_roles_blocks
    content {
      email = user_roles.value.email
      role  = user_roles.value.role
    }
  }

  zone_ids  = var.zone_ids
  all_zones = var.all_zones
}