resource "azurerm_subnet_service_endpoint_storage_policy" "subnet_service_endpoint_storage_policy" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "definition" {
    for_each = var.definition_block[*]
    content {
      name              = definition.value.name
      service           = definition.value.service
      service_resources = definition.value.service_resources
      description       = definition.value.description
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
