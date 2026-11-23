resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  dynamic "delegation" {
    for_each = var.delegation_blocks
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

  default_outbound_access_enabled = var.default_outbound_access_enabled

  dynamic "ip_address_pool" {
    for_each = var.ip_address_pool_block[*]
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }

  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  sharing_scope                                 = var.sharing_scope

  dynamic "service_endpoint" {
    for_each = var.service_endpoint_blocks
    content {
      service            = service_endpoint.value.service
      network_identifier = service_endpoint.value.network_identifier
    }
  }

  service_endpoint_policy_ids          = var.service_endpoint_policy_ids
  network_security_group_id_wo         = var.network_security_group_id_wo
  network_security_group_id_wo_version = var.network_security_group_id_wo_version
  route_table_id_wo                    = var.route_table_id_wo
  route_table_id_wo_version            = var.route_table_id_wo_version

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