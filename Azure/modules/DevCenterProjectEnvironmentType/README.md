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
- dev_center_id - (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_dev_center_project_environment_type](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_project_environment_type)