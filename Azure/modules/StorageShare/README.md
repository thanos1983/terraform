# Manages a File Share within Azure Storage

## Sample of use:

```bash
module "storage_share_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azurerm_storage_share"
  .
  .
  .
}
```

### Variables:

```bash 
- name (Required)
- storage_account_name (Required)
- access_tier (Optional)
- acl_blocks (Optional)
- quota (Required)
```

### Output:

```bash
- id
- name
- resource_manager_id
- url
```

###### More information can be found on the official document [azurerm_storage_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share)