resource "azurerm_mssql_server" "mssql_server" {
  name                                    = var.name
  resource_group_name                     = var.resource_group_name
  location                                = var.location
  version                                 = var.mssql_server_version
  administrator_login                     = var.administrator_login
  administrator_login_password            = var.administrator_login_password
  administrator_login_password_wo         = var.administrator_login_password_wo
  administrator_login_password_wo_version = var.administrator_login_password_wo_version

  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator_block[*]
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = azuread_administrator.value.tenant_id
      azuread_authentication_only = azuread_administrator.value.azuread_authentication_only
    }
  }

  connection_policy                        = var.connection_policy
  express_vulnerability_assessment_enabled = var.express_vulnerability_assessment_enabled

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  transparent_data_encryption_key_vault_key_id = var.transparent_data_encryption_key_vault_key_id
  minimum_tls_version                          = var.minimum_tls_version
  public_network_access_enabled                = var.public_network_access_enabled
  outbound_network_restriction_enabled         = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id            = var.primary_user_assigned_identity_id
  tags                                         = var.tags
}

module "kv_access_policy" {
  source             = "../KeyVaultAccessPolicy"
  count              = var.secret_permissions == null ? 0 : length(var.secret_permissions)
  key_vault_id       = var.key_vault_id
  secret_permissions = var.secret_permissions
  object_id          = data.azurerm_client_config.mssql_server.object_id
  application_id     = data.azurerm_client_config.mssql_server.client_id
  tenant_id          = azurerm_mssql_server.mssql_server.identity[0].tenant_id
}

# Create RBAC permissions for KV based on name(s)
module "kv_role_assignment_names" {
  source               = "../RoleAssignment"
  count                = var.role_definition_names == null ? 0 : length(var.role_definition_names)
  name                 = var.role_assignment_name
  scope                = azurerm_mssql_server.mssql_server.id
  role_definition_name = var.role_definition_names[count.index]
  principal_id         = var.principal_id == null ? azurerm_mssql_server.mssql_server.identity[0].principal_id : var.principal_id
}

# Create RBAC permissions for KV based on id(s)
module "kv_role_assignment_ids" {
  source               = "../RoleAssignment"
  count                = var.role_definition_ids == null ? 0 : length(var.role_definition_ids)
  name                 = var.role_assignment_name
  scope                = azurerm_mssql_server.mssql_server.id
  role_definition_name = var.role_definition_ids[count.index]
  principal_id         = var.principal_id == null ? azurerm_mssql_server.mssql_server.identity[0].principal_id : var.principal_id
}

module "kv_secret_administrator_login_mssql_server" {
  source       = "../KeyVaultSecret"
  count        = length(concat(var.secret_permissions, var.role_definition_names, var.role_definition_ids)) == 0 ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  value        = var.administrator_login
  name         = "mssql-administrator-login"
  depends_on = [
    azurerm_mssql_server.mssql_server, module.kv_role_assignment_ids, module.kv_role_assignment_names,
    module.kv_access_policy
  ]
}

module "kv_secret_administrator_login_password_mssql_server" {
  source       = "../KeyVaultSecret"
  count        = length(concat(var.secret_permissions, var.role_definition_names, var.role_definition_ids)) == 0 ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  value        = var.administrator_login_password
  name         = "mssql-administrator-login-password"
  depends_on = [
    azurerm_mssql_server.mssql_server, module.kv_role_assignment_ids, module.kv_role_assignment_names,
    module.kv_access_policy
  ]
}

module "mssql_server_firewall" {
  source           = "../MsSqlFirewallRule"
  for_each         = var.firewallRulesMap
  name             = each.key
  end_ip_address   = each.value.end_ip_address
  start_ip_address = each.value.start_ip_address
  server_id        = azurerm_mssql_server.mssql_server.id
}
