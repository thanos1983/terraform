resource "kubernetes_annotations" "annotations" {
  api_version = var.api_version
  kind        = var.kind

  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      name      = metadata.value.name
      namespace = metadata.value.namespace
    }
  }

  annotations          = var.annotations
  field_manager        = var.field_manager
  force                = var.force
  template_annotations = {}
}
