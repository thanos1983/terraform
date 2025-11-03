# Azure DNS CNAME Record

## Sample of use:

```bash
module "dns_cname_record_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_public_dns_cname_record"
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
- max_number_of_record_sets
- number_of_record_sets
- name_servers
```

###### More information can be found on the official document [azurerm_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone)
