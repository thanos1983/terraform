# Manages a Dev Center

## Sample of use:

```bash
module "dev_center_<project>" {
  source   = "git::https://example.com/dev_center_<my_repo>.git"
  name = "my_dev_center"
  .
  .
  .
}
```

### Variables:

```bash
- location - (Required)
- name - (Required)
- resources_group_name - (Required)
- identity - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- dev_center_uri
```

###### More information can be found on the official document [azurerm_dev_center](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center)
