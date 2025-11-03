# Azure Load Balancer

## Sample of use:

```bash
module "azure_load_balancer_<project>" {
  source              = "git::https://example.com/azure_<my_repo>.git"
  name                = "my_load_balancer"
  resource_group_name = "LoadBalancerRG"
  location            = "West Europe"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- edge_zone (Optional)
- frontend_ip_configuration_blocks (Required)
- sku (Optional)
- sku_tier (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- frontend_ip_configuration
- private_ip_address
- private_ip_addresses
```

###### More information can be found on the official document [azurerm_lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb)
