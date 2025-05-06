resource "azurerm_arc_kubernetes_cluster_extension" "arc_kubernetes_cluster_extension" {
  name                             = var.name
  cluster_id                       = var.cluster_id
  extension_type                   = var.extension_type
  configuration_protected_settings = var.configuration_protected_settings
  configuration_settings           = var.configuration_settings

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type = identity.value.type
    }
  }

  release_train     = var.release_train
  release_namespace = var.release_namespace
  target_namespace  = var.target_namespace
  version           = var.extension_version

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
