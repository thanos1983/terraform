resource "sysdig_monitor_team" "monitor_team" {
  name = var.name

  dynamic "entrypoint" {
    for_each = var.entrypoint_block[*]
    content {
      type      = entrypoint.value.type
      selection = entrypoint.value.selection
    }
  }

  description                   = var.description
  theme                         = var.theme
  scope_by                      = var.scope_by
  filter                        = var.filter
  can_use_sysdig_capture        = var.can_use_sysdig_capture
  can_see_infrastructure_events = var.can_see_infrastructure_events
  can_use_aws_data              = var.can_use_aws_data

  dynamic "user_roles" {
    for_each = var.user_roles_blocks
    content {
      email = user_roles.value.email
      role  = user_roles.value.role
    }
  }

  default_team                = var.default_team
  enable_ibm_platform_metrics = var.enable_ibm_platform_metrics
  ibm_platform_metrics        = var.ibm_platform_metrics
}