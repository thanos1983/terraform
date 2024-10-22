# Azure Network Interface and a Load Balancer's Backend Address Pool

## Sample of use:

```bash
module "network_interface_backend_address_pool_association_<project>" {
  source                  = "git::https://example.com/azure_<my_repo>.git"
  network_interface_id    = azurerm_network_interface.example.id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}
```

### Variables:

```bash
- network_interface_id (Required)
- ip_configuration_name (Required)
- backend_address_pool_id (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_network_interface_backend_address_pool_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association)