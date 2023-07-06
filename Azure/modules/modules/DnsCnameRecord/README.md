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
- location - (Required)
- zone_name - (Required)
- ttl - (Required)
- record - (Optional)
- target_resource_id - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- fqdn
```

###### More information can be found on the official document [azurerm_dns_cname_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record)