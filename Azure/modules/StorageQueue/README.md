# Manages a Queue within an Azure Storage Account

## Sample of use:

```bash
module "storage_queue_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_storage_queue"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- storage_account_name (Required)
- metadata (Optional)
```

### Output:

```bash
- id
- name
- resource_manager_id
```

###### More information can be found on the official document [azurerm_storage_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue)
