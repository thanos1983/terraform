# Azure Virtual Network

## Sample of use:

```bash
module "virtual_network_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_network_security_group"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name (Required)
- address_space (Required)
- location (Required)
- bgp_community (Optional)
- ddos_protection_plan_block (Optional)
- encryption_block (Optional)
- dns_server (Optional)
- edge_zone (Optional)
- flow_timeout_in_minutes (Optional)
- subnet_blocks (Optional)
- timeouts_block (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- resource_group_name
- location
- address_space
- guid
- subnet
```

###### More information can be found on the official document [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
