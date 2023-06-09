# Azure Key Vault

## Sample of use:

```bash
module "azure_kv_access_policy_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  key_vault_id = "my_kv_id"
  .
  .
  .
}
```

### Variables:

```bash
- key_vault_id (Required)
- tenant_id (Required)
- object_id (Required)
- application_id (Optional)
- certificate_permissions (Optional)
- key_permissions (Optional)
- secret_permissions (Optional)
- storage_permissions  (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_key_vault_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy)