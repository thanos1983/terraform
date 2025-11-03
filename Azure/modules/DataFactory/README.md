# Azure Storage Account

## Sample of use:

```bash
module "data_factory_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_data_factory"
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
- identity_block (Optional)
- vsts_configuration_block (Optional)
- managed_virtual_network_enabled (Optional)
- public_network_enabled (Optional)
- customer_managed_key_identity_id (Optional)
- purview_id (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- principal_id
- tenant_id
```

###### More information can be found on the official document [azurerm_data_factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory)
