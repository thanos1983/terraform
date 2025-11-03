# Azure Network Interface Group Association

## Sample of use:

```bash
module "network_interface_group_association_<project>" {
  source                    = "git::https://example.com/azure_<my_repo>.git"
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id  
}
```

### Variables:

```bash
- network_interface_id (Required)
- network_security_group_id (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_network_interface_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association)
