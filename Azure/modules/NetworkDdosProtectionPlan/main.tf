resource "azurerm_network_ddos_protection_plan" "network_ddos_protection_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

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
