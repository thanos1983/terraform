# Azure Subnet Route Table Association

## Sample of use:

```bash
module "subnet_route_table_association_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_subnet_route_table_association"
  .
  .
  .
}
```

### Variables:

```bash
- route_table_id - (Required)
- subnet_id - (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association.html)