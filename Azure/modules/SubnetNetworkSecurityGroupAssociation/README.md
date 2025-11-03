# Azure Subnet Network Security Group Association

## Sample of use:

```bash
module "subnet_network_security_group_association_<project>" {
  source                    = "git::https://example.com/azure_<my_repo>.git"
  subnet_id                 = var.subnet_id
  network_security_group_id = var.network_security_group_id
}
```

### Variables:

```bash
- subnet_id (Required)
- network_security_group_id (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association)
