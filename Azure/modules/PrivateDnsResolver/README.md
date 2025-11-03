# Azure Private DNS Resolver

## Sample of use:

```bash
module "private_dns_resolver_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_resolver"
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
- virtual_network_id (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_private_dns_resolver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver)
