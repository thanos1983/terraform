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
- name - (Required)
- tags (Optional)
```

### Output:

```bash
- id
- name
- version
- versionless_id
```

###### More information can be found on the official document [azurerm_key_vault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)
