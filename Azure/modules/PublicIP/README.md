# Azure Public IP

## Sample of use:

```bash
module "public_ip_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_public_ip"
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
- allocation_method - (Required)
- zones - (Optional)
- ddos_protection_mode - (Optional)
- ddos_protection_plan_id - (Optional)
- domain_name_label - (Optional)
- edge_zone - (Optional)
- idle_timeout_in_minutes - (Optional)
- ip_tags - (Optional)
- ip_version - (Optional)
- public_ip_prefix_id - (Optional)
- reverse_fqdn - (Optional)
- sku - (Optional)
- sku_tier - (Optional)
- tags - (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- ip_address
- fqdn
- domain_name_label
- idle_timeout_in_minutes
- ddos_protection_mode
- ddos_protection_plan_id
- ip_version
- sku
- ip_tags
- tags
- zones
```

###### More information can be found on the official document [azurerm_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)