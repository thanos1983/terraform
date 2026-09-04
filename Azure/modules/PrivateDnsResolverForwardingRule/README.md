# Azure Private DNS Resolver Forwarding Rule

## Sample of use:

```bash
module "private_dns_resolver_forwarding_rule_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_resolver_forwarding_rule"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- dns_forwarding_ruleset_id - (Required)
- domain_name (Required)
- target_dns_servers (Required)
- enabled - (Optional)
- metadata - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_private_dns_resolver_forwarding_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_forwarding_rule)