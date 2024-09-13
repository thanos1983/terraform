# Manages a Dev Center Network Connection

## Sample of use:

```bash
module "dev_center_network_connection_<project>" {
  source   = "git::https://example.com/dev_center_network_connection_<my_repo>.git"
  name = "my_dev_center_network_connection"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name - (Required)
- location - (Required)
- domain_join_type - (Required)
- subnet_id - (Required)
- domain_name - (Optional)
- domain_password - (Optional)
- domain_username - (Optional)
- organization_unit - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_dev_center_network_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_project_environment_type)