# Manages a Recurrence Trigger within a Logic App Workflow

## Sample of use:

```bash
module "sample_logic_app_trigger_recurrence_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  name = "my_logic_app_trigger_recurrence"
  .
  .
}
```

### Variables:

```bash
- name (Required)
- logic_app_id (Required)
- frequency (Required)
- interval (Required)
- start_time (Optional)
- time_zone (Optional)
- schedule_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [logic_app_trigger_recurrence](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_trigger_recurrence)
