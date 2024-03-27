# Manages a Custom Action within a Logic App Workflow

## Sample of use:

```bash
module "sample_logic_app_action_custom_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  name = "my_logic_app_action_custom"
  .
  .
}
```

### Variables:

```bash
- name (Required)
- logic_app_id (Required)
- body (Required)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [logic_app_action_custom](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_action_custom).