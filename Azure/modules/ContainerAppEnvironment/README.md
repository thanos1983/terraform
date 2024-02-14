# Azure Application Insights

## Sample of use:

```bash
module "azurerm_container_app_environment_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azurerm_container_app_environment"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- dapr_application_insights_connection_string (optional)
- infrastructure_subnet_id (optional)
- internal_load_balancer_enabled (optional)
- zone_redundancy_enabled (optional)
- log_analytics_workspace_id (optional)
- workload_profile_block (optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- default_domain
- docker_bridge_cidr
- platform_reserved_cidr
- platform_reserved_dns_ip_address
- static_ip_address
```

###### More information can be found on the official document [azurerm_container_app_environment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment)