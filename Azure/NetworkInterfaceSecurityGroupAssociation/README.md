# Azure Network Interface

## Sample of use:

```bash
module "public_network_interface_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_public_network_interface"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name - (Required)
- location - (Required)
- ip_configuration_block - (Required)
- dns_servers - (Optional)
- edge_zone - (Optional)
- enable_ip_forwarding - (Optional)
- enable_accelerated_networking - (Optional)
- internal_dns_name_label - (Optional)
- tags - (Optional)
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
```

###### More information can be found on the official document [azurerm_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)