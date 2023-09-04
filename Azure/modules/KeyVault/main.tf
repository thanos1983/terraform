resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  sku_name            = var.sku_name
  tenant_id           = var.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  dynamic "network_acls" {
    for_each = var.network_acls_block
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days

  dynamic "contact" {
    for_each = var.contact_block[*]
    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }

  tags = var.tags
}

module "kv_access_policy" {
  source                  = "../KeyVaultAccessPolicy"
  count                   = var.kv_access_policy == null ? 0 : 1
  key_vault_id            = azurerm_key_vault.key_vault.id
  object_id               = var.object_id
  tenant_id               = var.tenant_id
  certificate_permissions = var.certificate_permissions
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  storage_permissions     = var.storage_permissions
}

module "kv_role_assignment" {
  source               = "../RoleAssignment"
  count                = var.kv_role_assignment == null ? 0 : 1
  scope                = azurerm_key_vault.key_vault.id
  principal_id         = var.object_id
  role_definition_id   = var.role_definition_id
  role_definition_name = var.role_definition_name
}