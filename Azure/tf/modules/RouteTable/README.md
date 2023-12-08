# Azure Route Table

## Sample of use:

```bash
module "azurerm_route_table_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azurerm_route_table"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name (Required)
- location (Optional)
- route_block (Optional)
- disable_bgp_route_propagation (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- principal_type
```

###### More information can be found on the official document [route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table)