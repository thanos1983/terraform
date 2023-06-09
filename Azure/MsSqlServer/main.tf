module "password" {
  source      = "../RandomPassword"
  count       = var.administrator_login_password == null ? 1 : 0
  length      = var.length
  lower       = var.lower
  min_lower   = var.min_lower
  min_numeric = var.min_numeric
  min_special = var.min_special
  min_upper   = var.min_upper
  numeric     = var.numeric
  special     = var.special
  upper       = var.upper
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.name
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = var.mssql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = coalesce(var.administrator_login_password, module.password[0].result)

  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator_block[*]
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = azuread_administrator.value.tenant_id
      azuread_authentication_only = azuread_administrator.value.azuread_authentication_only
    }
  }

  connection_policy = var.connection_policy

  identity {
    type = var.identity_type
  }

  minimum_tls_version                  = var.minimum_tls_version
  public_network_access_enabled        = var.public_network_access_enabled
  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = var.primary_user_assigned_identity_id
  tags                                 = var.tags

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "until az sql server show --name '${azurerm_mssql_server.mssql_server.name}' --resource-group '${azurerm_mssql_server.mssql_server.resource_group_name}' --output none; do echo 'Waiting for MSSQL Server to become accessible...'; sleep 3; done;"
  }
}

module "kv_access_policy_mssql_server" {
  source             = "../KeyVaultAccessPolicy"
  count              = var.access_policy_kv == false ? 0 : 1
  key_vault_id       = var.key_vault_id
  object_id          = data.azuread_service_principal.mssql_server.object_id
  tenant_id          = var.tenant_id
  application_id     = data.azuread_service_principal.mssql_server.application_id
  secret_permissions = var.secret_permissions
  depends_on         = [
    azurerm_mssql_server.mssql_server
  ]
}

module "kv_secret_administrator_login_mssql_server" {
  source       = "../KeyVaultSecret"
  count        = var.access_policy_kv == false ? 0 : 1
  key_vault_id = var.key_vault_id
  name         = "administrator-login"
  value        = var.administrator_login
  depends_on   = [
    azurerm_mssql_server.mssql_server,
    module.kv_access_policy_mssql_server
  ]
}

module "kv_secret_administrator_login_password_mssql_server" {
  source       = "../KeyVaultSecret"
  count        = var.access_policy_kv == false ? 0 : 1
  key_vault_id = var.key_vault_id
  name         = "administrator-login-password"
  value        = coalesce(var.administrator_login_password, module.password[0].result)
  depends_on   = [
    azurerm_mssql_server.mssql_server,
    module.kv_access_policy_mssql_server
  ]
}

module "mssql_server_firewall" {
  source           = "../MsSqlFirewallRule"
  for_each         = var.firewallRulesMap
  name             = each.key
  server_id        = azurerm_mssql_server.mssql_server.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}