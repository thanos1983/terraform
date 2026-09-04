# Azure Private DNS Zone

## Sample of use:

```bash
module "private_dns_zone_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_zone"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name - (Required)
- soa_record_block - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- soa_record
- number_of_record_sets
- max_number_of_record_sets
- max_number_of_virtual_network_links
- max_number_of_virtual_network_links_with_registration
```

###### More information can be found on the official document [azurerm_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone)