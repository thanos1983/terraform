# Azure Key Vault

## Sample of use:

```bash
module "my_msmssql_server_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_msmssql_server"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)  
- version (Optional)
- administrator_login (Required)
- administrator_login_password (Optional) # if not defined random password is chosen
- azuread_administrator_block (Optional)
- connection_policy (Optional)
- identity_type (Optional)
- minimum_tls_version (Optional)
- public_network_access_enabled (Optional)
- outbound_network_restriction_enabled (Optional)
- primary_user_assigned_identity_id (Optional)    
- tags (Optional)
- access_policy_kv (Optional) # Create access policy to kv if the user desires
- kv_name (Optional) # In combination with access policy (see variable access_policy_kv)
- kv_rg_name (Optional) # In combination with access policy (see variable access_policy_kv). If not defined default RG will be used.
- certificate_permissions (Optional) # In combination with access policy (see variable access_policy_kv)
- key_permissions (Optional) # In combination with access policy (see variable access_policy_kv)
- secret_permissions (Optional) # In combination with access policy (see variable access_policy_kv)
- storage_permissions (Optional) # In combination with access policy (see variable access_policy_kv)
```

### Output:

```bash
- id
- name
- administrator_login
- administrator_login_password
- fully_qualified_domain_name
- restorable_dropped_database_ids
```

### Special Variables

```bash
variable "firewallRulesMap" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = null
}
```

Sample of how to use it:

```bash
locals {
  addressPrefixesRules = {
    "addressPrefixesRuleOne" = {
      start_ip_address = "1.1.1.0"
      end_ip_address   = "1.1.1.255"
    }
  }
}
```

###### More information can be found on the official document [azurerm_mssql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/msmssql_server)
