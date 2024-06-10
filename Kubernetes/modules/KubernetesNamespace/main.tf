resource "kubernetes_namespace_v1" "namespace" {
  dynamic "metadata" {
    for_each = var.metadata_block
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  wait_for_default_service_account = var.wait_for_default_service_account

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      delete = timeouts.value.delete
    }
  }
}