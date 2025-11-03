# Azure Data Factory Linked Service Azure SQL Database

## Sample of use:

```bash
module "data_factory_linked_service_azure_sql_database_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_data_factory_linked_service_azure_sql_database"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- data_factory_id (Required)
- connection_string (Optional)
- use_managed_identity (Optional)
- service_principal_id (Optional)
- service_principal_key (Optional)
- tenant_id (Optional)
- integration_runtime_name (Optional)
- annotations (optional)
- parameters (optional)
- additional_properties (Optional)
- key_vault_connection_string_block (Optional block)
- key_vault_password_block (Optional block)
- timeouts_block (Optional block)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_linked_service_azure_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_sql_database)
