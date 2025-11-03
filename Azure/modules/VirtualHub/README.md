# Azure Virtual HUB

## Sample of use:

```bash
module "virtual_hub_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_virtual_hub"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- location (Required)
- address_prefix (Optional)
- hub_routing_preference (Optional)
- route (Optional)
- sku (Optional)
- virtual_wan_id (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_virtual_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub)
