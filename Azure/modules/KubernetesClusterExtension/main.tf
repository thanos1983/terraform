resource "azurerm_kubernetes_cluster_extension" "kubernetes_cluster_extension" {
  name                             = var.name
  cluster_id                       = var.cluster_id
  extension_type                   = var.extension_type
  configuration_protected_settings = var.configuration_protected_settings
  configuration_settings           = var.configuration_settings

  dynamic "plan" {
    for_each = var.plan_block[*]
    content {
      name           = plan.value.name
      product        = plan.value.product
      publisher      = plan.value.publisher
      promotion_code = plan.value.promotion_code
      version        = plan.value.version
    }
  }

  release_train     = var.release_train
  release_namespace = var.release_namespace
  target_namespace  = var.target_namespace
  version           = var.aks_extension_version

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
