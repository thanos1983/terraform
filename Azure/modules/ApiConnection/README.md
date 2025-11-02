# Manages an API Connection

## Sample of use:

```bash
module "api_connection<project>" {
  source   = "git::https://example.com/api_connection_<my_repo>.git"
  name     = "my_api_connection"
  .
  .
  .
}
```

### Variables:

```bash
- managed_api_id (Required)
- name (Required)
- resource_group_name (Required)
- display_name (Optional)
- parameter_values (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [api_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_connection)
