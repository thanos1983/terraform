resource "kubernetes_persistent_volume_claim_v1" "persistent_volume_claim" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
      namespace     = metadata.value.namespace
    }
  }

  dynamic "spec" {
    for_each = var.spec_block[*]
    content {
      access_modes = spec.value.access_modes

      dynamic "resources" {
        for_each = spec.value.resources_block[*]
        content {
          limits   = resources.value.limits
          requests = resources.value.requests
        }
      }

      dynamic "selector" {
        for_each = spec.value.selector_block[*]
        content {
          dynamic "match_expressions" {
            for_each = selector.value.match_expressions_block
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
          match_labels = selector.value.match_labels
        }
      }

      storage_class_name = spec.value.storage_class_name
      volume_name        = spec.value.volume_name
      volume_mode        = spec.value.volume_mode
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
    }
  }

  wait_until_bound = var.wait_until_bound
}