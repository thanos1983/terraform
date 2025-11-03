# Azure Local Network Gateway

## Sample of use:

```bash
module "local_network_gateway_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_local_network_gateway"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- location (Required)
- address_space (Optional)
- bgp_settings_block (Optional)
- gateway_address (Optional)
- gateway_address (Optional)
- gateway_fqdn (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_local_network_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway.html)
