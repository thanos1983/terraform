resource "azurerm_container_registry" "container_registry" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  dynamic "georeplications" {
    for_each = var.georeplications_blocks
    content {
      location                  = georeplications.value.location
      regional_endpoint_enabled = georeplications.value.regional_endpoint_enabled
      zone_redundancy_enabled   = georeplications.value.zone_redundancy_enabled
      tags                      = georeplications.value.tags
    }
  }

  dynamic "network_rule_set" {
    for_each = var.network_rule_set[*]
    content {
      default_action = network_rule_set.value.default_action
      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rule_blocks
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }
    }
  }

  public_network_access_enabled = var.public_network_access_enabled

  dynamic "retention_policy" {
    for_each = var.retention_policy_block[*]
    content {
      days    = retention_policy.value.days
      enabled = retention_policy.value.enabled
    }
  }

  dynamic "trust_policy" {
    for_each = var.trust_policy_block[*]
    content {
      enabled = trust_policy.value.enabled
    }
  }

  zone_redundancy_enabled = var.zone_redundancy_enabled
  export_policy_enabled   = var.export_policy_enabled

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_block[*]
    content {
      enabled            = encryption.value.enabled
      key_vault_key_id   = encryption.value.key_vault_key_id
      identity_client_id = encryption.value.identity_client_id
    }
  }

  anonymous_pull_enabled     = var.anonymous_pull_enabled
  data_endpoint_enabled      = var.data_endpoint_enabled
  network_rule_bypass_option = var.network_rule_bypass_option
  tags                       = var.tags

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