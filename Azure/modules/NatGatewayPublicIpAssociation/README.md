# Azure NAT Gateway and Public IP Association

## Sample of use:

```bash
module "nat_gateway_public_ip_association_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- nat_gateway_id (Required)
- public_ip_address_id (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_nat_gateway_public_ip_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association)