resource "azurerm_custom_provider" "custom_provider" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "resource_type" {
    for_each = var.resource_type_blocks
    content {
      name         = resource_type.value.name
      endpoint     = resource_type.value.endpoint
      routing_type = resource_type.value.routing_type
    }
  }

  dynamic "action" {
    for_each = var.action_blocks
    content {
      name     = action.value.name
      endpoint = action.value.endpoint
    }
  }

  dynamic "validation" {
    for_each = var.validation_blocks
    content {
      specification = validation.value.specification
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