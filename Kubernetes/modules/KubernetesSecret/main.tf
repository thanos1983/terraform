resource "kubernetes_secret" "secret" {
  data        = var.data
  binary_data = var.binary_data

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

  type                           = var.type
  immutable                      = var.immutable
  wait_for_service_account_token = var.wait_for_service_account_token

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
    }
  }
}