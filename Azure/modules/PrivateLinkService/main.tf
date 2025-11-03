resource "azurerm_private_link_service" "private_link_service" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "nat_ip_configuration" {
    for_each = var.nat_ip_configuration_blocks
    content {
      name                       = nat_ip_configuration.value.name
      primary                    = nat_ip_configuration.value.primary
      subnet_id                  = nat_ip_configuration.value.subnet_id
      private_ip_address         = nat_ip_configuration.value.private_ip_address
      private_ip_address_version = nat_ip_configuration.value.private_ip_address_version
    }
  }

  load_balancer_frontend_ip_configuration_ids = var.load_balancer_frontend_ip_configuration_ids
  auto_approval_subscription_ids              = var.auto_approval_subscription_ids
  enable_proxy_protocol                       = var.enable_proxy_protocol
  fqdns                                       = var.fqdns
  visibility_subscription_ids                 = var.visibility_subscription_ids
  tags                                        = var.tags

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
