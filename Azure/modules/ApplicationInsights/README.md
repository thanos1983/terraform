# Azure Application Insights

## Sample of use:

```bash
module "bastion_host_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_application_insights"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- application_type (Required)
- daily_data_cap_in_gb (Optional)
- daily_data_cap_notifications_disabled (Optional)
- retention_in_days (Optional)
- sampling_percentage (Optional)
- disable_ip_masking (Optional)
- workspace_id (Optional)
- local_authentication_disabled (Optional)
- internet_ingestion_enabled (Optional)
- internet_query_enabled (Optional)
- force_customer_storage_for_profiler (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- app_id
- instrumentation_key (sensitive)
- connection_string (sensitive)
```

###### More information can be found on the official document [application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights.html)