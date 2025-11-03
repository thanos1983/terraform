# Azure Load Balancer Backend Address Pool

## Sample of use:

```bash
module "lb_backend_address_pool_<project>" {
  source              = "git::https://example.com/azure_<my_repo>.git"
  name                = "my_lb_backend_address_pool"
  .
  .
  .
}
```

### Variables:

```bash
- backend_address_pool_id (Required)
- ip_address (Optional)
- name (Required)
- virtual_network_id (Optional)
- backend_address_ip_configuration_id (Optional)
```

### Output:

```bash
- id
- name
- inbound_nat_rule_port_mapping
```

###### More information can be found on the official document [azurerm_lb_backend_address_pool_address](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool_address)
