# Azure Load Balancer Rule

## Sample of use:

```bash
module "lb_rule_<project>" {
  source          = "git::https://example.com/azure_<my_repo>.git"
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- loadbalancer_id (Required)
- frontend_ip_configuration_name (Required)
- protocol (Required)
- frontend_port (Required)
- backend_port (Required)
- backend_address_pool_ids (Optional)
- probe_id (Optional)
- enable_floating_ip (Optional)
- idle_timeout_in_minutes (Optional)
- load_distribution (Optional)
- disable_outbound_snat (Optional)
- enable_tcp_reset (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule)
