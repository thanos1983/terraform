resource "azurerm_resource_group_template_deployment" "resource_group_template_deployment" {
  deployment_mode          = var.deployment_mode
  name                     = var.name
  resource_group_name      = var.resource_group_name
  debug_level              = var.debug_level
  template_content         = var.template_content
  template_spec_version_id = var.template_spec_version_id
  parameters_content       = var.parameters_content
  tags                     = var.tags

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
