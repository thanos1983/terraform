resource "azurerm_arc_resource_bridge_appliance" "arc_resource_bridge_appliance" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  distro              = var.distro

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type = identity.value.type
    }
  }

  infrastructure_provider = var.infrastructure_provider
  public_key_base64       = var.public_key_base64
  tags                    = var.tags

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