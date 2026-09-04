resource "azurerm_dev_center_environment_type" "dev_center_environment_type" {
  name                  = var.name
  location              = var.location
  dev_center_project_id = var.dev_center_project_id
  deployment_target_id  = var.deployment_target_id

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  creator_role_assignment_roles = var.creator_role_assignment_roles

  dynamic "user_role_assignment" {
    for_each = var.user_role_assignment_block[*]
    content {
      user_id = user_role_assignment.value.user_id
      roles   = user_role_assignment.value.roles
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