resource "kubernetes_config_map" "config_map" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  binary_data = var.binary_data
  data        = var.data
  immutable   = var.immutable
}
