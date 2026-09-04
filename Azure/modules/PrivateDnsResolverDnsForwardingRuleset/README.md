# Azure Private DNS Resolver DNS Forwarding Ruleset

## Sample of use:

```bash
module "private_dns_resolver_dns_forwarding_ruleset_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_resolver_dns_forwarding_ruleset"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name - (Required)
- private_dns_resolver_outbound_endpoint_ids (Required)
- location - (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_private_dns_resolver_dns_forwarding_ruleset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_dns_forwarding_ruleset)