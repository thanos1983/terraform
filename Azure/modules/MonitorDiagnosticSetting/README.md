# Azure Monitor Diagnostic Settings

## Sample of use:

```bash
module "monitor_diagnostic_setting_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_monitor_diagnostic_setting"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- target_resource_id (Required)
- eventhub_name (Optional)
- eventhub_authorization_rule_id (Optional)
- enabled_log_blocks (Optional)
- log_analytics_workspace_id (Optional)
- enabled_metric_blocks (Optional)
- storage_account_id (Optional)
- log_analytics_destination_type (Optional)
- partner_solution_id (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_monitor_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting.html)
