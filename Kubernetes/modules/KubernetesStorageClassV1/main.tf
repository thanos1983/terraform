resource "kubernetes_storage_class_v1" "storage_class_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  storage_provisioner    = var.storage_provisioner
  allow_volume_expansion = var.allow_volume_expansion

  dynamic "allowed_topologies" {
    for_each = var.allowed_topologies_block[*]
    content {
      dynamic "match_label_expressions" {
        for_each = allowed_topologies.value.match_label_expressions_block[*]
        content {
          key    = match_label_expressions.value.key
          values = match_label_expressions.value.values
        }
      }
    }
  }

  mount_options       = var.mount_options
  parameters          = var.parameters
  reclaim_policy      = var.reclaim_policy
  volume_binding_mode = var.volume_binding_mode
}