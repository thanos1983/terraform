resource "azurerm_api_management" "api_management" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name

  dynamic "additional_location" {
    for_each = var.additional_location_blocks
    content {
      location             = additional_location.value.location
      capacity             = additional_location.value.capacity
      zones                = additional_location.value.zones
      public_ip_address_id = additional_location.value.public_ip_address_id
      dynamic "virtual_network_configuration" {
        for_each = additional_location.value.virtual_network_configuration_block[*]
        content {
          subnet_id = virtual_network_configuration.value.subnet_id
        }
      }
      gateway_disabled = additional_location.value.location
    }
  }

  dynamic "certificate" {
    for_each = var.certificate_blocks
    content {
      encoded_certificate  = certificate.value.encoded_certificate
      store_name           = certificate.value.store_name
      certificate_password = certificate.value.certificate_password
    }
  }

  client_certificate_enabled = var.client_certificate_enabled

  dynamic "delegation" {
    for_each = var.delegation_block[*]
    content {
      subscriptions_enabled     = delegation.value.subscriptions_enabled
      user_registration_enabled = delegation.value.user_registration_enabled
      url                       = delegation.value.url
      validation_key            = delegation.value.validation_key
    }
  }

  gateway_disabled = var.gateway_disabled
  min_api_version  = var.min_api_version
  zones            = var.zones

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "hostname_configuration" {
    for_each = var.hostname_configuration_block[*]
    content {
      dynamic "management" {
        for_each = ""
        content {
          host_name = ""
        }
      }
      dynamic "portal" {
        for_each = ""
        content {
          host_name = ""
        }
      }
      dynamic "developer_portal" {
        for_each = ""
        content {
          host_name = ""
        }
      }
      dynamic "proxy" {
        for_each = ""
        content {
          host_name = ""
        }
      }
      dynamic "scm" {
        for_each = ""
        content {
          host_name = ""
        }
      }
    }
  }

  notification_sender_email = var.notification_sender_email

  dynamic "protocols" {
    for_each = var.protocols_block[*]
    content {}
  }

  dynamic "security" {
    for_each = var.security_block[*]
    content {}
  }

  dynamic "sign_in" {
    for_each = var.sign_in_block[*]
    content {
      enabled = false
    }
  }

  dynamic "sign_up" {
    for_each = var.sign_up_block[*]
    content {
      enabled = false
    }
  }

  dynamic "tenant_access" {
    for_each = var.tenant_access_block[*]
    content {
      enabled = false
    }
  }

  public_ip_address_id          = var.public_ip_address_id
  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_type          = var.virtual_network_type

  dynamic "virtual_network_configuration" {
    for_each = var.virtual_network_configuration_block[*]
    content {
      subnet_id = ""
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