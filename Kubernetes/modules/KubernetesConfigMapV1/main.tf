resource "kubernetes_config_map_v1" "config_map" {
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

  binary_data = var.binary_data
  data        = var.data
  immutable   = var.immutable
}
