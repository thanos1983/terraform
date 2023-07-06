# Azure Network Interface

## Sample of use:

```bash
module "network_interface_security_group_association_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
```

### Variables:

```bash
- network_interface_id - (Required)
- network_security_group_id - (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_network_interface_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association)