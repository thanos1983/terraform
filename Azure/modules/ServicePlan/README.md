# Manages an App Service: Service Plan

## Sample of use:

```bash
module "service_principal_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_service_plan"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- location (Required)
- os_type (Required)
- resource_group_name (Required)
- sku_name (Required)
- app_service_environment_id (Optional)
- maximum_elastic_worker_count (Optional)
- worker_count (Optional)
- per_site_scaling_enabled (Optional)
- zone_balancing_enabled (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- kind
- reserved
```

###### More information can be found on the official document [service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)