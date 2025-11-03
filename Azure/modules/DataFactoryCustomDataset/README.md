# Azure Data Factory Custom Dataset

## Sample of use:

```bash
module "azurerm_data_factory_custom_dataset_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_custom_dataset"
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
- linked_service_parameters (Optional)
- type (Required)
- type_properties_json (Required JSON object)
- additional_properties (Optional map string)
- annotations (optional list of strings)
- description (Optional)
- folder (Optional)
- parameters (optional)
- schema_json (Optional JSON object) # sample jsonencode({"hello"="world"})
- timeouts_block (Optional block)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_custom_dataset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_custom_dataset)
