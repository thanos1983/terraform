# Azure Monitor Alert Processing Rule Action Group

## Sample of use:

```bash
module "monitor_alert_processing_rule_action_group_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_monitor_alert_processing_rule_action_group"
  .
  .
  .
}
```

### Variables:

```bash
- add_action_group_ids (Required)
- name - (Required)
- resources_group_name (Required)
- scopes (Required)
- condition_block (Optional)
- description (Optional)
- enabled (Optional)
- schedule_block (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [monitor_alert_processing_rule_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_alert_processing_rule_action_group)
