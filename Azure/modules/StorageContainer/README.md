# Azure Storage Account Container

## Sample of use:

```bash
module "storage_account_container_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_storage_container"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- storage_account_id (Required)
- container_access_type (Optional)
- default_encryption_scope (Optional)
- encryption_scope_override_enabled (Optional)
- metadata (Optional)
```

### Output:

```bash
- id
- name
- has_immutability_policy
- has_legal_hold
```

###### More information can be found on the official document [azurerm_storage_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container)
