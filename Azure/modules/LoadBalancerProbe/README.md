# Azure Load Balancer

## Sample of use:

```bash
module "azurerm_lb_probe_<project>" {
  source          = "git::https://example.com/azure_<my_repo>.git"
  name            = "my_azurerm_lb_probe"
  loadbalancer_id = azurerm_lb.example.id
  protocol        = 80
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- loadbalancer_id (Required)
- protocol (Optional)
- port (Required)
- probe_threshold (Optional)
- request_path (Optional)
- interval_in_seconds (Optional)
- number_of_probes (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe)