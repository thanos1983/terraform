resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  type                            = var.type
  virtual_network_gateway_id      = var.virtual_network_gateway_id
  authorization_key               = var.authorization_key
  dpd_timeout_seconds             = var.dpd_timeout_seconds
  express_route_circuit_id        = var.express_route_circuit_id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway_id
  local_azure_ip_address_enabled  = var.local_azure_ip_address_enabled
  local_network_gateway_id        = var.local_network_gateway_id
  routing_weight                  = var.routing_weight
  shared_key                      = var.shared_key
  connection_mode                 = var.connection_mode
  connection_protocol             = var.connection_protocol
  enable_bgp                      = var.enable_bgp

  dynamic "custom_bgp_addresses" {
    for_each = var.custom_bgp_addresses_block[*]
    content {
      primary   = custom_bgp_addresses.value.primary
      secondary = custom_bgp_addresses.value.secondary
    }
  }

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors

  dynamic "ipsec_policy" {
    for_each = var.ipsec_policy_block[*]
    content {
      dh_group         = ipsec_policy.value.dh_group
      ike_encryption   = ipsec_policy.value.ike_encryption
      ike_integrity    = ipsec_policy.value.ike_integrity
      ipsec_encryption = ipsec_policy.value.ipsec_encryption
      ipsec_integrity  = ipsec_policy.value.ipsec_integrity
      pfs_group        = ipsec_policy.value.pfs_group
      sa_datasize      = ipsec_policy.value.sa_datasize
      sa_lifetime      = ipsec_policy.value.sa_lifetime
    }
  }

  dynamic "traffic_selector_policy" {
    for_each = var.traffic_selector_policy_block
    content {
      local_address_cidrs  = traffic_selector_policy.value.local_address_cidrs
      remote_address_cidrs = traffic_selector_policy.value.remote_address_cidrs
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