resource "kubernetes_service_account_v1" "service_account" {
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

  dynamic "image_pull_secret" {
    for_each = var.image_pull_secret_blocks
    content {
      name = image_pull_secret.value.name
    }
  }

  dynamic "secret" {
    for_each = var.secret_blocks
    content {
      name = secret.value.name
    }
  }

  automount_service_account_token = var.automount_service_account_token
}
