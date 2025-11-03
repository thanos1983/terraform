# Azure Private DNS Zone Virtual Network Link

## Sample of use:

```bash
module "private_dns_zone_virtual_network_link_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_zone_virtual_network_link"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- private_dns_zone_name (Required)
- resources_group_name - (Required)
- virtual_network_id - (Required)
- registration_enabled - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_private_dns_zone_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link)
