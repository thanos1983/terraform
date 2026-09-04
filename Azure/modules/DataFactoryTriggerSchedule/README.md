# Azure Data Factory Trigger Schedule

## Sample of use:

```bash
module "data_factory_trigger_schedule_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name    = "my_data_factory_trigger_schedule"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- data_factory_id (Required)
- description (Optional)
- schedule (Optional)
- start_time (Optional)
- time_zone (Optional)
- end_time (Optional)
- interval (Optional)
- frequency (Optional)
- activated (Optional)
- pipeline (Optional)
- pipeline_name (Optional)
- pipeline_parameters (Optional)
- annotations (Optional)
- timeouts_block (Optional block)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_data_factory_linked_service_azure_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_linked_service_azure_sql_database)