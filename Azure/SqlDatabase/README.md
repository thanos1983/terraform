# Azure Key Vault

## Sample of use:

```bash
module "azure_kv_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_kv"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location (Required)
- resource_group (Required)
- sku_name (Required)
- tenant_id (Required)
- access_policy_block (Optional block)
- enabled_for_deployment (Optional)
- enabled_for_disk_encryption (Optional)
- enabled_for_template_deployment (Optional)
- enable_rbac_authorization (Optional)
- network_acls_block (Optional block map of objects)
- purge_protection_enabled (Optional)
- public_network_access_enabled (Optional)
- soft_delete_retention_days (Optional)
- contact_block (Optional block)
- tags (Optional)
```

### Output:

```bash
- id
- name
- vault_uri
```

###### More information can be found on the official document [azurerm_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)