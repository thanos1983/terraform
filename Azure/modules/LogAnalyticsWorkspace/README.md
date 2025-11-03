# Azure Log Analytics (formally Operational Insights) Workspace

## Sample of use:

```bash
module "log_analytics_workspace_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_log_analytics_workspace"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- location (Required)
- allow_resource_only_permissions (Optional)
- local_authentication_disabled (Optional)
- sku (Optional)
- retention_in_days (Optional)
- cmk_for_query_forced (Optional)
- internet_ingestion_enabled (Optional)
- internet_query_enabled (Optional)
- reservation_capacity_in_gb_per_day (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- primary_shared_key
- secondary_shared_key
- workspace_id
```

###### More information can be found on the official document [azurerm_log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)
