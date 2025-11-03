# Azure Data Factory Linked Service Key Vault

## Sample of use:

```bash
module "data_factory_linked_service_key_vault_<project>" {
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
- data_factory_id (Required)
- key_vault_id (Required)
- description (Optional)
- integration_runtime_name (Optional)
- annotations (Optional)
- parameters (Optional)
- additional_properties (Optional)
- timeouts_block (optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_linked_service_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_key_vault)
