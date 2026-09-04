resource "azurerm_bastion_host" "bastion_host" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  copy_paste_enabled  = var.copy_paste_enabled
  file_copy_enabled   = var.file_copy_enabled
  sku                 = var.sku

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.ip_configuration_subnet_id
    public_ip_address_id = var.ip_configuration_public_ip_address_id
  }

  ip_connect_enabled     = var.ip_connect_enabled
  scale_units            = var.scale_units
  shareable_link_enabled = var.shareable_link_enabled
  tunneling_enabled      = var.tunneling_enabled
  tags                   = var.tags

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