resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  resource_group_name = var.resources_group_name
  address_space       = var.address_space
  location            = var.location
  bgp_community       = var.bgp_community

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_block[*]
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dns_servers             = var.dns_server
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }

  tags = var.tags
}

module "subnet" {
  source                                    = "../VirtualNetworkSubNet"
  name                                      = var.subnet_name
  address_prefixes                          = var.subnet_address_prefixes
  virtual_network_name                      = azurerm_virtual_network.virtual_network.name
  resource_group_name                       = azurerm_virtual_network.virtual_network.resource_group_name
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  service_endpoints                         = var.service_endpoints
  service_endpoint_policy_ids               = var.service_endpoint_policy_ids
}