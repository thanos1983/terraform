resource "azurerm_logic_app_workflow" "logic_app_workflow" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "access_control" {
    for_each = var.access_control_block[*]
    content {
      dynamic "action" {
        for_each = access_control.value.action_block[*]
        content {
          allowed_caller_ip_address_range = action.value.allowed_caller_ip_address_range
        }
      }
      dynamic "content" {
        for_each = access_control.value.content_block[*]
        content {
          allowed_caller_ip_address_range = content.value.allowed_caller_ip_address_range
        }
      }
      dynamic "trigger" {
        for_each = access_control.value.trigger_block[*]
        content {
          allowed_caller_ip_address_range = trigger.value.allowed_caller_ip_address_range
          dynamic "open_authentication_policy" {
            for_each = access_control.value.open_authentication_policy_block[*]
            content {
              name = open_authentication_policy.value.name
              dynamic "claim" {
                for_each = open_authentication_policy.value.claim_block[*]
                content {
                  name  = claim.value.name
                  value = claim.value.value
                }
              }
            }
          }
        }
      }
      dynamic "workflow_management" {
        for_each = access_control.value.workflow_management_block[*]
        content {
          allowed_caller_ip_address_range = workflow_management.value.allowed_caller_ip_address_range
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  integration_service_environment_id = var.integration_service_environment_id
  logic_app_integration_account_id   = var.logic_app_integration_account_id
  enabled                            = var.enabled
  workflow_parameters                = var.workflow_parameters
  workflow_schema                    = var.workflow_schema
  workflow_version                   = var.workflow_version
  parameters                         = var.parameters
  tags                               = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}