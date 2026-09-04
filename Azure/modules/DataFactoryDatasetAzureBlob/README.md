# Azure Data Factory Dataset Azure Blob

## Sample of use:

```bash
module "azurerm_data_factory_dataset_azure_blob_<project>" {
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
- linked_service_name (Required)
- folder (Optional)
- schema_column (Optional)
- description (optional)
- annotations (Optional)
- parameters (Optional)
- additional_properties (Optional)
- path (optional)
- filename (optional)
- dynamic_path_enabled (optional)
- dynamic_filename_enabled (optional)
- timeouts_block (optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_dataset_azure_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_dataset_azure_blob)