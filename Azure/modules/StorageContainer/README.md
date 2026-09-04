# Azure Storage Account

## Sample of use:

```bash
module "storage_container_<project>" {
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
- metadata (Optional)
```

### Output:

```bash
- id
- has_immutability_policy
- has_legal_hold
- resource_manager_id
```

###### More information can be found on the official document [azurerm_storage_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container)