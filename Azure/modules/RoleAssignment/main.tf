resource "azurerm_role_assignment" "role_assignment" {
  name                                   = var.name
  scope                                  = var.scope
  role_definition_id                     = var.role_definition_id
  role_definition_name                   = var.role_definition_name
  principal_id                           = var.principal_id
  condition                              = var.condition
  condition_version                      = var.condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  description                            = var.description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check

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