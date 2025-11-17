resource "kubernetes_config_map_v1_data" "config_map_data" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      name      = metadata.value.name
      namespace = metadata.value.namespace
    }
  }

  data          = var.data
  field_manager = var.field_manager
  force         = var.force
}
