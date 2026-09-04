# Azure Data Factory Dataset Delimiter Text

## Sample of use:

```bash
module "azurerm_data_factory_dataset_delimited_text_<project>" {
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
- schema_column_block (Optional block)
- description (optional)
- annotations (Optional)
- parameters (Optional)
- additional_properties (Optional)
- path (optional)
- azure_blob_fs_location_block (optional block)
- azure_blob_storage_location_block (optional block)
- http_server_location_block (optional block)
- column_delimiter (optional)
- row_delimiter (optional)
- encoding (optional)
- quote_character (optional)
- escape_character (optional)
- first_row_as_header (optional)
- null_value (optional)
- compression_codec (optional)
- compression_level (optional)
- timeouts_block (optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_dataset_azure_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_dataset_azure_blob)