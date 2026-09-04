# Manages a Dev Center Project Environment Type

## Sample of use:

```bash
module "dev_center_project_environment_type_<project>" {
  source   = "git::https://example.com/dev_center_project_environment_type_<my_repo>.git"
  name = "my_dev_center_project_environment_type"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location - (Required)
- dev_center_project_id - (Required)
- deployment_target_id - (Required)
- identity - (Optional)
- creator_role_assignment_roles - (Optional)
- user_role_assignment - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_dev_center_project_environment_type](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_project_environment_type)