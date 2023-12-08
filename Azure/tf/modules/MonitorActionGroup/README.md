# Azure Monitor Action Group

## Sample of use:

```bash
module "monitor_action_group_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_monitor_action_group"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- short_name (Required)
- enabled (Optional)
- arm_role_receiver_block (Optional)
- automation_runbook_receiver_block (Optional)
- azure_app_push_receiver_block (Optional)
- azure_function_receiver_block (Optional)
- email_receiver_block (Optional)
- event_hub_receiver_block (Optional)
- itsm_receiver_block (Optional)
- location (Optional)
- logic_app_receiver_block (Optional)
- sms_receiver_block (Optional)
- voice_receiver_block (Optional)
- webhook_receiver_block (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group)