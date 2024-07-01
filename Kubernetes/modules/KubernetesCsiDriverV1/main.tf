resource "kubernetes_csi_driver_v1" "csi_driver_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  dynamic "spec" {
    for_each = var.spec_block
    content {
      attach_required        = spec.value.attach_required
      pod_info_on_mount      = spec.value.pod_info_on_mount
      volume_lifecycle_modes = spec.value.volume_lifecycle_modes
    }
  }
}