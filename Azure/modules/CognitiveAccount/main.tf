resource "azurerm_cognitive_account" "cognitive_account" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  kind                       = var.kind
  sku_name                   = var.sku_name
  custom_subdomain_name      = var.custom_subdomain_name
  dynamic_throttling_enabled = var.dynamic_throttling_enabled

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key_block[*]
    content {
      key_vault_key_id   = customer_managed_key.value.key_vault_key_id
      identity_client_id = customer_managed_key.value.identity_client_id
    }
  }

  fqdns = var.fqdns

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  local_auth_enabled              = var.local_auth_enabled
  metrics_advisor_aad_client_id   = var.metrics_advisor_aad_client_id
  metrics_advisor_aad_tenant_id   = var.metrics_advisor_aad_tenant_id
  metrics_advisor_super_user_name = var.metrics_advisor_super_user_name
  metrics_advisor_website_name    = var.metrics_advisor_website_name

  dynamic "network_acls" {
    for_each = var.network_acls_block[*]
    content {
      default_action = network_acls.value.default_action
      ip_rules       = network_acls.value.ip_rules
      dynamic "virtual_network_rules" {
        for_each = network_acls.value.virtual_network_rules_blocks
        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
        }
      }
    }
  }

  outbound_network_access_restricted           = var.outbound_network_access_restricted
  public_network_access_enabled                = var.public_network_access_enabled
  qna_runtime_endpoint                         = var.qna_runtime_endpoint
  custom_question_answering_search_service_id  = var.custom_question_answering_search_service_id
  custom_question_answering_search_service_key = var.custom_question_answering_search_service_key

  dynamic "storage" {
    for_each = var.storage_blocks
    content {
      storage_account_id = storage.value.storage_account_id
      identity_client_id = storage.value.identity_client_id
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

# Store the Primary Access Key in KV
module "cognitive_account_primary_access_key" {
  source       = "../KeyVaultSecret"
  count        = (var.role_definition_names == null || var.role_definition_ids == null || var.secret_permissions == null) ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  name         = "cognitive-account-primary-access-key"
  value        = azurerm_cognitive_account.cognitive_account.primary_access_key
}