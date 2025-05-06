resource "azurerm_arc_kubernetes_cluster" "arc_kubernetes_cluster" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  agent_public_key_certificate = var.agent_public_key_certificate

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type = identity.value.type
    }
  }

  location = var.location
  tags     = var.tags

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
