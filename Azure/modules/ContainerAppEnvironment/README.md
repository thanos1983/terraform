# Manages a Dapr Component for a Container App Environment

## Sample of use:

```bash
module "container_app_environment_dapr_component_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_container_app_environment_dapr_component"
  .
  .
  .
}
```

### Variables:

```bash
- container_app_environment_id - (Required)
- name - (Required)
- component_type - (Required)
- dapr_component_version (Required)
- ignore_errors (Optional)
- init_timeout (Optional)
- medata_blocks (optional)
- scopes (Optional)
- secret_block (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_container_app_environment_dapr_component](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment_dapr_component)