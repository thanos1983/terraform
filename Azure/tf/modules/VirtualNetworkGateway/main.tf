resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  dynamic "ip_configuration" {
    for_each = var.ip_configuration_block
    content {
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      subnet_id                     = ip_configuration.value.subnet_id
      name                          = ip_configuration.value.name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }

  name                             = var.name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  sku                              = var.sku
  type                             = var.type
  active_active                    = var.active_active
  default_local_network_gateway_id = var.default_local_network_gateway_id
  edge_zone                        = var.edge_zone
  enable_bgp                       = var.enable_bgp

  dynamic "bgp_settings" {
    for_each = var.bgp_settings_block[*]
    content {
      asn         = bgp_settings.value.asn
      peer_weight = bgp_settings.value.peer_weight
      dynamic "peering_addresses" {
        for_each = bgp_settings.value.peering_addresses
        content {
          ip_configuration_name = peering_addresses.value.ip_configuration_name
          apipa_addresses       = peering_addresses.value.apipa_addresses

        }
      }
    }
  }

  dynamic "custom_route" {
    for_each = var.custom_route_block[*]
    content {
      address_prefixes = custom_route.value.address_prefixes
    }
  }

  generation                 = var.generation
  private_ip_address_enabled = var.private_ip_address_enabled

  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration_block[*]
    content {
      address_space = vpn_client_configuration.value.address_space
      aad_tenant    = vpn_client_configuration.value.aad_tenant
      aad_audience  = vpn_client_configuration.value.aad_audience
      aad_issuer    = vpn_client_configuration.value.aad_issuer
      dynamic "root_certificate" {
        for_each = vpn_client_configuration.value.root_certificate
        content {
          name             = root_certificate.value.name
          public_cert_data = root_certificate.value.public_cert_data
        }
      }
      dynamic "revoked_certificate" {
        for_each = vpn_client_configuration.value.revoked_certificate
        content {
          name       = revoked_certificate.value.name
          thumbprint = revoked_certificate.value.thumbprint
        }
      }
      radius_server_address = vpn_client_configuration.value.radius_server_address
      radius_server_secret  = vpn_client_configuration.value.radius_server_secret
      vpn_client_protocols  = vpn_client_configuration.value.vpn_client_protocols
      vpn_auth_types        = vpn_client_configuration.value.vpn_auth_types
    }
  }

  vpn_type = var.vpn_type
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