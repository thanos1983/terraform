resource "azurerm_cognitive_deployment" "cognitive_deployment" {
  name                 = var.name
  cognitive_account_id = var.cognitive_account_id

  dynamic "model" {
    for_each = var.model_block[*]
    content {
      format  = model.value.format
      name    = model.value.name
      version = model.value.version
    }
  }

  dynamic "scale" {
    for_each = var.scale_block[*]
    content {
      type     = scale.value.type
      tier     = scale.value.tier
      size     = scale.value.size
      family   = scale.value.family
      capacity = scale.value.capacity
    }
  }

  rai_policy_name        = var.rai_policy_name
  version_upgrade_option = var.version_upgrade_option

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
