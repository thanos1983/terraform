# Azure Key Vault Secret

## Sample of use:

```bash
module "azure_kv_secret_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_kv_secret"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- value (Required)
- key_vault_id (Required)
- content_type (Optional)
- not_before_date (Optional)
- expiration_date (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- version
- versionless_id
```

###### More information can be found on the official document [azurerm_key_vault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)
