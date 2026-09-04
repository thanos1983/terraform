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
- name (Required)
- loadbalancer_id (Required)
- synchronous_mode (Optional)
- tunnel_interface_blocks (Optional)
- virtual_network_id (Optional)
```

### Output:

```bash
- id
- backend_ip_configurations
- load_balancing_rules
- inbound_nat_rules
- outbound_rules
```

###### More information can be found on the official document [lb_backend_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool)