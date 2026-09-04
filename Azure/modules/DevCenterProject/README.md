# Manages a Dev Center Project

## Sample of use:

```bash
module "dev_center_project_<project>" {
  source   = "git::https://example.com/dev_center_project_<my_repo>.git"
  name = "my_dev_center_project"
  .
  .
  .
}
```

### Variables:

```bash
- dev_center_id - (Required)
- location - (Required)
- name - (Required)
- resources_group_name - (Required)
- description - (Optional)
- maximum_dev_boxes_per_user - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- dev_center_uri
```

###### More information can be found on the official document [azurerm_dev_center_project](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_project)