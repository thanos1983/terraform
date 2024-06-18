resource "kustomization_resource" "resource" {
  provider = kustomization
  manifest = var.manifest
  wait     = var.wait

  dynamic "timeouts" {
    for_each = var.timeouts_block
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}