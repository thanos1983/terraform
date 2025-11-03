# Azure Private DNS Resolver Inbound Endpoint

## Sample of use:

```bash
module "private_dns_resolver_outbound_endpoint_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_dns_resolver_inbound_endpoint"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- private_dns_resolver_id - (Required)
- ip_configurations_block (Required)
- location - (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_private_dns_resolver_inbound_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_inbound_endpoint)
