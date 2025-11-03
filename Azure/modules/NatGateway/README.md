# Azure NAT Gateway

## Sample of use:

```bash
module "nat_gateway_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- idle_timeout_in_minutes (Optional)
- sku_name (Optional)
- tags - (Optional)
- zones (Optional)
```

### Output:

```bash
- id
- name
- resource_guid
```

###### More information can be found on the official document [azurerm_nat_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway)
