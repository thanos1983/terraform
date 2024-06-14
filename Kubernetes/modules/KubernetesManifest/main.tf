resource "kubernetes_manifest" "manifest" {
  computed_fields = var.computed_fields
  manifest        = var.manifest
  object          = var.object

  dynamic "wait" {
    for_each = var.wait_block[*]
    content {
      rollout = wait.value.rollout

      dynamic "condition" {
        for_each = wait.value.condition_block[*]
        content {
          status = condition.value.status
          type   = condition.value.type
        }
      }

      fields = wait.value.fields
    }
  }

  dynamic "field_manager" {
    for_each = var.field_manager_block[*]
    content {
      name            = field_manager.value.name
      force_conflicts = field_manager.value.force_conflicts
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}