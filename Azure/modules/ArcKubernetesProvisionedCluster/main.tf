resource "azurerm_arc_kubernetes_provisioned_cluster" "arc_kubernetes_provisioned_cluster" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type = identity.value.type
    }
  }

  location                       = var.location
  arc_agent_auto_upgrade_enabled = var.arc_agent_auto_upgrade_enabled
  arc_agent_desired_version      = var.arc_agent_desired_version

  dynamic "azure_active_directory" {
    for_each = var.azure_active_directory_block[*]
    content {
      admin_group_object_ids = azure_active_directory.value.admin_group_object_ids
      azure_rbac_enabled     = azure_active_directory.value.azure_rbac_enabled
      tenant_id              = azure_active_directory.value.tenant_id
    }
  }

  tags = var.tags

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
