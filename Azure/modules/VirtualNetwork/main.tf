resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  resource_group_name = var.resource_group_name
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

  dynamic "encryption" {
    for_each = var.encryption_block[*]
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dns_servers             = var.dns_server
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  dynamic "subnet" {
    for_each = var.subnet_blocks
    content {
      name                            = subnet.value.name
      address_prefix                  = subnet.value.address_prefix
      security_group                  = subnet.value.security_group
      default_outbound_access_enabled = subnet.value.default_outbound_access_enabled
      dynamic "delegation" {
        for_each = subnet.value.delegation_blocks
        content {
          name = delegation.value.name
          dynamic "service_delegation" {
            for_each = delegation.value.service_delegation_block[*]
            content {
              name    = service_delegation.value.name
              actions = service_delegation.value.actions
            }
          }
        }
      }
      private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
    }
  }

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