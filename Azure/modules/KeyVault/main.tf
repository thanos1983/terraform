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

# Assign Access Policies if enabled
module "kv_access_policy" {
  source                  = "../KeyVaultAccessPolicy"
  count                   = var.kv_access_policy == null ? 0 : 1
  object_id               = var.object_id
  tenant_id               = var.tenant_id
  application_id          = var.application_id
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  storage_permissions     = var.storage_permissions
  certificate_permissions = var.certificate_permissions
  key_vault_id            = azurerm_key_vault.key_vault.id
}

# Create RBAC permissions for KV based on name(s)
module "kv_role_assignment_names" {
  source               = "../RoleAssignment"
  count                = var.role_definition_names == null ? 0 : length(var.role_definition_names)
  principal_id         = var.principal_id
  name                 = var.role_assignment_name
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = var.role_definition_names[count.index]
}

# Create RBAC permissions for KV based on id(s)
module "kv_role_assignment_ids" {
  source             = "../RoleAssignment"
  count              = var.role_definition_ids == null ? 0 : length(var.role_definition_ids)
  principal_id       = var.principal_id
  name               = var.role_assignment_name
  scope              = azurerm_key_vault.key_vault.id
  role_definition_id = var.role_definition_ids[count.index]
}