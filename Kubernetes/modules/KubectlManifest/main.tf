resource "kubectl_manifest" "manifest" {
  yaml_body          = var.yaml_body
  sensitive_fields   = var.sensitive_fields
  force_new          = var.force_new
  server_side_apply  = var.server_side_apply
  field_manager      = var.field_manager
  force_conflicts    = var.force_conflicts
  apply_only         = var.apply_only
  ignore_fields      = var.ignore_fields
  override_namespace = var.override_namespace
  validate_schema    = var.validate_schema
  wait               = var.wait
  wait_for_rollout   = var.wait_for_rollout

  dynamic "wait_for" {
    for_each = var.wait_for
    content {
      field = wait_for.value.field
    }
  }
}