resource "kubernetes_labels" "labels" {
  api_version = var.api_version
  kind        = var.kind

  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      name      = metadata.value.name
      namespace = metadata.value.namespace
    }
  }

  labels        = var.labels
  field_manager = var.field_manager
  force         = var.force
}