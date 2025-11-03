# Azure Network Interface

## Sample of use:

```bash
module "network_interface_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- ip_configuration_blocks (Required)
- location (Required)
- name (Required)
- resource_group_name (Required)
- auxiliary_mode (Optional)
- auxiliary_sku (Optional)
- dns_servers (Optional)
- edge_zone (Optional)
- ip_forwarding_enabled (Optional)
- accelerated_networking_enabled (Optional)
- internal_dns_name_label (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- applied_dns_servers
- internal_domain_name_suffix
- mac_address
- private_ip_address
- private_ip_addresses
- virtual_machine_id
- ip_configuration
```

###### More information can be found on the official document [azurerm_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)
