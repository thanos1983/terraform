# Azure Data Factory Pipeline

## Sample of use:

```bash
module "data_factory_pipeline_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_data_factory_pipeline"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- data_factory_id (Required)
- description (Required)
- annotations (Optional)
- concurency (Optional)
- folder (Optional)
- moniter_metrics_after_duration (Optional)
- parameters (Optional)
- variables (Optional)
- activities_json (Optional JSON string) # sample jsonencode({"hello"="world"})
- timeouts_block (Optional) 
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_pipeline](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_pipeline)