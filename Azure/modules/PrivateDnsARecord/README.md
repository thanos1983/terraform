# Enables you to manage DNS A Records within Azure Private DNS

## Sample of use:

```bash
module "private_dns_a_record_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_a_record"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resources_group_name (Required)
- zone_name (Required)
- ttl (Required)
- records (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- fqdn
```

###### More information can be found on the official document [azurerm_private_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record)