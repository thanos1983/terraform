# Azure Monitor Metric Alert

## Sample of use:

```bash
module "monitor_metric_alert_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_monitor_metric_alert"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- scopes (Required)
- criteria_blocks (Optional)
- dynamic_criteria_block (Optional)
- application_insights_web_test_location_availability_criteria_block (Optional)
- action_blocks (Optional)
- enabled (Optional)
- auto_mitigate (Optional)
- description (Optional)
- frequency (Optional)
- severity (Optional)
- target_resource_type (Optional)
- target_resource_location (Optional)
- window_size (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [monitor_metric_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert)