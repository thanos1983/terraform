resource "azurerm_dev_center_network_connection" "dev_center_network_connection" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  domain_join_type    = var.domain_join_type
  subnet_id           = var.subnet_id
  domain_name         = var.domain_name
  domain_password     = var.domain_password
  domain_username     = var.domain_username
  organization_unit   = var.organization_unit
  tags                = var.tags

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